<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\Klausul;
use App\Models\Level;
use App\Models\Question;
use App\Models\AuditAnswer;
use Barryvdh\DomPDF\Facade\Pdf as FacadePdf;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facades\Pdf;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Project::all();
        return view('project.index', compact('projects'));
    }

    public function create()
    {
        $klausuls = Klausul::all();
        return view('project.create', compact('klausuls'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_project' => 'required|string',
            'auditor' => 'nullable|string',
            'klausul_id' => 'required|array',
            'level_id' => 'required|array',
        ]);
        $project = Project::create([
            'nama_project' => $validated['nama_project'],
            'auditor' => $validated['auditor'] ?? null,
        ]);
        // Simpan level yang dipilih ke session agar bisa dipakai di audit
        session(['selected_levels' => $validated['level_id']]);
        return redirect()->route('project.levelList', $project->id);
    }

    public function levelList($id)
    {
        $project = Project::findOrFail($id);
        $levelIds = session('selected_levels', []);
        $levels = \App\Models\Level::whereIn('id', $levelIds)->with('klausul')->get();
        return view('project.level_list', compact('project', 'levels'));
    }

    public function audit($id)
    {
        $project = Project::findOrFail($id);
        $klausuls = Klausul::all();
        $levels = Level::all();
        // Tampilkan form audit (pilih klausul, level, pertanyaan, input jawaban)
        return view('project.audit', compact('project', 'klausuls', 'levels'));
    }

    public function saveAudit(Request $request, $id)
    {
        $project = Project::findOrFail($id);
        $validated = $request->validate([
            'answers' => 'required|array',
            'answers.*.klausul_id' => 'required|exists:klausuls,id',
            'answers.*.level_id' => 'required|exists:levels,id',
            'answers.*.question_id' => 'required|exists:questions,id',
            'answers.*.jawaban' => 'required|boolean',
            'answers.*.bukti_hasil_kerja' => 'nullable|string',
        ]);
        foreach ($validated['answers'] as $answer) {
            AuditAnswer::create([
                'project_id' => $project->id,
                'klausul_id' => $answer['klausul_id'],
                'level_id' => $answer['level_id'],
                'question_id' => $answer['question_id'],
                'jawaban' => $answer['jawaban'],
                'bukti_hasil_kerja' => $answer['bukti_hasil_kerja'] ?? null,
            ]);
        }
        return redirect()->route('project.show', $project->id)->with('success', 'Audit berhasil disimpan');
    }

    public function show($id)
    {
        $project = Project::with('auditAnswers')->findOrFail($id);
        // Hitung total skor
        $total = 0;
        $count = $project->auditAnswers->count();
        if ($count > 0) {
            $total = ($project->auditAnswers->sum('jawaban') / $count) * 100;
        }
        // Hitung total per level
        $totals = [];
        $levels = $project->auditAnswers->groupBy('level_id');
        foreach ($levels as $levelId => $answers) {
            $count = count($answers);
            $score = $count > 0 ? (collect($answers)->sum('jawaban') / $count) * 100 : 0;
            $totals[$levelId] = $score;
        }
        return view('project.show', compact('project', 'totals', 'total'));
    }

    public function auditLevel($id, $level_id)
    {
        $project = Project::findOrFail($id);
        $level = Level::with(['questions', 'klausul'])->findOrFail($level_id);
        // Cek apakah sudah pernah di-audit
        $answers = AuditAnswer::where('project_id', $project->id)->where('level_id', $level->id)->get();
        return view('project.audit_level', compact('project', 'level', 'answers'));
    }

    public function saveAuditLevel(Request $request, $id, $level_id)
    {
        $project = Project::findOrFail($id);
        $level = Level::findOrFail($level_id);
        $validated = $request->validate([
            'answers' => 'required|array',
            'answers.*.question_id' => 'required|exists:questions,id',
            'answers.*.jawaban' => 'required|boolean',
            'answers.*.bukti_hasil_kerja' => 'nullable|string',
        ]);
        foreach ($validated['answers'] as $answer) {
            AuditAnswer::updateOrCreate([
                'project_id' => $project->id,
                'level_id' => $level->id,
                'question_id' => $answer['question_id'],
            ], [
                'klausul_id' => $level->klausul_id,
                'jawaban' => $answer['jawaban'],
                'bukti_hasil_kerja' => $answer['bukti_hasil_kerja'] ?? null,
            ]);
        }
        // Cari level berikutnya dari pilihan project
        $selectedLevels = request()->session()->get('selected_levels', []);
        $currentIndex = array_search($level->id, $selectedLevels);
        $nextLevelId = $selectedLevels[$currentIndex + 1] ?? null;
        if ($nextLevelId) {
            return redirect()->route('project.auditLevel', [$project->id, $nextLevelId]);
        }
        return redirect()->route('project.show', $project->id)->with('success', 'Audit selesai untuk semua level');
    }

    public function downloadPdf($id)
    {
        $project = Project::with(['auditAnswers.level.klausul', 'auditAnswers.question'])->findOrFail($id);
        // Data untuk PDF
        $totals = [];
        $levels = $project->auditAnswers->groupBy('level_id');
        foreach ($levels as $levelId => $answers) {
            $count = count($answers);
            $score = $count > 0 ? (collect($answers)->sum('jawaban') / $count) * 100 : 0;
            $totals[$levelId] = $score;
        }
        $grandTotal = count($totals) > 0 ? (array_sum($totals) / count($totals)) : 0;
        $pdf = FacadePdf::loadView('project.report_pdf', compact('project', 'totals', 'grandTotal'));
        return $pdf->download('report_project_'.$project->id.'.pdf');
    }
}
