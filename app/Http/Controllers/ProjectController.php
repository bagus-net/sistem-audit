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

    // Endpoint AJAX: return all level_id[] for selected klausul
    public function getLevelsByKlausul(Request $request)
    {
        $ids = $request->input('klausul_ids', []);
        $levelIds = Level::whereIn('klausul_id', $ids)->pluck('id')->toArray();
        return response()->json(['level_ids' => $levelIds]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_project' => 'required|string',
            'auditor' => 'nullable|string',
            'klausul_id' => 'required|array',
        ]);
        $klausulIds = $request->input('klausul_id');
        $project = Project::create([
            'nama_project' => $validated['nama_project'],
            'auditor' => $validated['auditor'] ?? null,
        ]);
        // Simpan klausul yang dipilih ke session
        session(['selected_klausuls' => $klausulIds]);
        // Cari level 2 dari klausul pertama
        $firstKlausulId = $klausulIds[0];
        $level2 = \App\Models\Level::where('klausul_id', $firstKlausulId)->where('level', 2)->first();
        if ($level2) {
            return redirect()->route('project.auditLevel', [$project->id, $level2->id]);
        } else {
            // Jika tidak ada level 2, langsung ke level list
            return redirect()->route('project.levelList', $project->id);
        }
    }

    public function levelList($id)
    {
        $project = Project::findOrFail($id);
        // Ambil klausul dari session (input project) jika ada, jika tidak fallback ke klausul yang sudah diaudit, jika tidak ada juga tampilkan semua klausul
        $selectedKlausuls = session('selected_klausuls', []);
        $auditedLevelIds = [];
        if (!empty($selectedKlausuls)) {
            $klausulIds = $selectedKlausuls;
            // Optionally, you can fill $auditedLevelIds with audited levels for these klausul (not strictly needed for view, but prevents undefined)
            // $auditedLevelIds = AuditAnswer::where('project_id', $project->id)->whereIn('klausul_id', $klausulIds)->pluck('level_id')->unique()->toArray();
        } else {
            $auditedLevelIds = AuditAnswer::where('project_id', $project->id)->pluck('level_id')->unique()->toArray();
            $auditedLevels = [];
            $klausulIds = [];
            if (!empty($auditedLevelIds)) {
                $auditedLevels = \App\Models\Level::whereIn('id', $auditedLevelIds)->get();
                $klausulIds = $auditedLevels->pluck('klausul_id')->unique()->toArray();
            }
            if (empty($klausulIds)) {
                $klausulIds = \App\Models\Klausul::pluck('id')->toArray();
            }
        }
        $levels = \App\Models\Level::whereIn('klausul_id', $klausulIds)->with('klausul')->get();

        // Hitung lockedKlausulLevel: untuk setiap klausul, cari level tertinggi yang sudah diaudit dengan skor < passing
        $lockedKlausulLevel = [];
        $passing = 15;
        foreach ($klausulIds as $kid) {
            $klausulLevels = $levels->where('klausul_id', $kid);
            $maxFailed = null;
            foreach ($klausulLevels as $lvl) {
                $answers = AuditAnswer::where('project_id', $project->id)->where('level_id', $lvl->id)->get();
                $count = $answers->count();
                $score = $count > 0 ? ($answers->sum('jawaban') / $count) * 100 : null;
                if ($score !== null && $score < $passing) {
                    if ($maxFailed === null || $lvl->level > $maxFailed) {
                        $maxFailed = $lvl->level;
                    }
                }
            }
            if ($maxFailed !== null) {
                $lockedKlausulLevel[$kid] = $maxFailed;
            }
        }

        return view('project.level_list', compact('project', 'levels', 'auditedLevelIds', 'lockedKlausulLevel'));
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
        $project = Project::with(['auditAnswers.level.klausul', 'auditAnswers.question'])->findOrFail($id);
        // Filter only audited levels (levels that have at least one answer)
        $auditedAnswers = $project->auditAnswers;
        // Group by klausul_id and get the highest level audited for each klausul
        $klausulLevelMap = [];
        foreach ($auditedAnswers as $answer) {
            $klausulId = $answer->klausul_id;
            $levelNum = $answer->level->level ?? 0;
            if (!isset($klausulLevelMap[$klausulId]) || $levelNum > $klausulLevelMap[$klausulId]) {
                $klausulLevelMap[$klausulId] = $levelNum;
            }
        }
        // For table: only show answers for audited levels (not for levels that are not audited)
        $auditedLevelIds = [];
        foreach ($klausulLevelMap as $klausulId => $maxLevel) {
            // Get all level ids for this klausul up to maxLevel
            $levelIds = \App\Models\Level::where('klausul_id', $klausulId)
                ->where('level', '<=', $maxLevel)
                ->pluck('id')->toArray();
            $auditedLevelIds = array_merge($auditedLevelIds, $levelIds);
        }
        // Only show answers for these level ids
        $filteredAnswers = $auditedAnswers->whereIn('level_id', $auditedLevelIds);

        // Calculate global recap score as per formula
        $totalKlausul = count($klausulLevelMap);
        $sumLevel = array_sum($klausulLevelMap);
        $globalRecap = $totalKlausul > 0 ? ($sumLevel / $totalKlausul) : 0;

        // For per-level score (optional, can be removed if not needed)
        $totals = [];
        $levels = $filteredAnswers->groupBy('level_id');
        foreach ($levels as $levelId => $answers) {
            $count = count($answers);
            $score = $count > 0 ? (collect($answers)->sum('jawaban') / $count) * 100 : 0;
            $totals[$levelId] = $score;
        }

        return view('project.show', [
            'project' => $project,
            'totals' => $totals,
            'total' => 0, // not used anymore
            'filteredAnswers' => $filteredAnswers,
            'globalRecap' => $globalRecap,
            'klausulLevelMap' => $klausulLevelMap,
            'totalKlausul' => $totalKlausul,
        ]);
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
        // --- FLOW LANJUTAN ---
        // Hitung skor level ini
        $answers = AuditAnswer::where('project_id', $project->id)->where('level_id', $level->id)->get();
        $count = $answers->count();
        $score = $count > 0 ? ($answers->sum('jawaban') / $count) * 100 : 0;
        // Passing grade: 15% (berdasarkan tabel: <15% = N, >=15% = P/L)
        $passing = 15;
        // Ambil klausul yang dipilih dari session
        $selectedKlausuls = session('selected_klausuls', []);
        // Urutkan klausul dan level
        $currentKlausulId = $level->klausul_id;
        $currentLevel = $level->level;
        // Cek apakah boleh lanjut ke level berikutnya atau ke klausul berikutnya
        if ($score < $passing) {
            // Mapping pesan saran per klausul dan level
            $advice = [
                4 => [
                    2 => 'Pemahaman konteks organisasi perlu ditingkatkan. Disarankan penerapan aktivitas dasar yang lengkap dan terarah.',
                    3 => 'Disarankan untuk mendefinisikan proses secara jelas dan memanfaatkan aset organisasi secara terstruktur guna mendukung pemahaman konteks organisasi.',
                    4 => 'Disarankan proses didefinisikan dengan baik dan kinerjanya diukur secara kuantitatif untuk memahami konteks organisasi secara menyeluruh.',
                    5 => 'Disarankan agar proses didefinisikan dengan jelas, kinerjanya diukur secara konsisten, dan perbaikan berkelanjutan diterapkan untuk mendukung pemahaman konteks organisasi.',
                ],
                5 => [
                    2 => 'Disarankan agar kepemimpinan menerapkan serangkaian aktivitas dasar yang lengkap dan terstruktur untuk mencapai tujuan organisasi secara efektif.',
                    3 => 'Disarankan agar kepemimpinan mendefinisikan proses secara jelas dan memanfaatkan aset organisasi secara terorganisir untuk mencapai tujuan secara efektif.',
                    4 => 'Disarankan agar kepemimpinan memastikan proses didefinisikan dengan baik dan kinerjanya diukur secara kuantitatif untuk meningkatkan efektivitas pengelolaan.',
                    5 => 'Disarankan agar kepemimpinan terus mendefinisikan proses dengan jelas, mengukur kinerja secara rutin, dan menerapkan perbaikan berkelanjutan untuk mencapai hasil yang optimal.',
                ],
                6 => [
                    2 => 'Disarankan agar proses perencanaan mencapai tujuannya melalui penerapan aktivitas dasar yang lengkap, yang dapat dikarakteristikkan sebagai dilakukan',
                    3 => 'Disarankan agar proses perencanaan mencapai tujuannya dengan cara yang lebih terorganisir melalui pemanfaatan aset organisasi, di mana proses dirancang dan didefinisikan dengan baik',
                    4 => 'Disarankan agar proses perencanaan mencapai tujuannya melalui perencanaan yang didefinisikan dengan baik dan diukur kinerjanya secara kuantitatif',
                    5 => 'Disarankan agar proses perencanaan mencapai tujuannya, didefinisikan dengan baik, kinerjanya diukur, dan perbaikan terus menerus dilakukan untuk meningkatkan kinerja',
                ],
                7 => [
                    2 => 'Disarankan agar aktivitas pendukung dijalankan konsisten untuk mendukung tercapainya tujuan proses.',
                    3 => 'Disarankan agar aset organisasi dimanfaatkan secara terorganisir melalui aktivitas pendukung untuk memastikan proses berjalan efektif.',
                    4 => 'Disarankan agar aktivitas pendukung dijalankan secara konsisten untuk menjaga kinerja proses yang terdefinisi dengan baik dan terukur secara kuantitatif.',
                    5 => 'Disarankan agar aktivitas pendukung dijalankan konsisten guna mendukung proses terdefinisi, terukur, dan terus ditingkatkan.',
                ],
                8 => [
                    2 => 'Disarankan agar aktivitas operasional dijalankan secara menyeluruh dan konsisten untuk memastikan proses mencapai tujuannya secara efektif.',
                    3 => 'Disarankan agar aset organisasi dimanfaatkan secara optimal dalam aktivitas operasional yang terstruktur untuk mendukung proses yang telah didefinisikan dengan baik.',
                    4 => 'Disarankan agar aktivitas operasional dijalankan secara konsisten untuk mendukung proses yang terdefinisi dengan baik dan kinerjanya terukur secara kuantitatif.',
                    5 => 'Disarankan agar aktivitas operasional dilaksanakan secara konsisten untuk mendukung proses yang terdefinisi, terukur, dan terus ditingkatkan melalui perbaikan berkelanjutan.',
                ],
                9 => [
                    2 => 'Disarankan agar evaluasi kinerja dilakukan lebih terstruktur untuk meningkatkan efektivitas proses yang masih bersifat intuitif.',
                    3 => 'Disarankan agar evaluasi kinerja dilakukan secara konsisten untuk mendukung pencapaian tujuan proses melalui aktivitas yang sudah berjalan lengkap.',
                    4 => 'Disarankan agar evaluasi kinerja dilakukan secara terencana dengan memanfaatkan aset organisasi untuk mendukung proses yang terdefinisi dengan baik dan terorganisir.',
                    5 => 'Disarankan agar evaluasi kinerja dilakukan secara konsisten untuk mendukung proses yang terdefinisi, terukur, dan terus ditingkatkan melalui perbaikan berkelanjutan.',
                ],
                10 => [
                    2 => 'Disarankan agar aktivitas peningkatan dilakukan secara konsisten untuk mendukung pencapaian tujuan proses melalui langkah-langkah dasar yang telah dijalankan secara lengkap.',
                    3 => 'Disarankan agar aktivitas peningkatan dilakukan secara terorganisir dengan memanfaatkan aset organisasi untuk mendukung proses yang telah didefinisikan dengan baik.',
                    4 => 'Disarankan agar peningkatan difokuskan pada proses yang terdefinisi dan terukur untuk menjaga pencapaian tujuan.',
                    5 => 'Disarankan agar peningkatan berkelanjutan dilakukan untuk mendukung proses yang terdefinisi, terukur, dan fokus pada kinerja.',
                ],
            ];
            $pesan = isset($advice[$currentKlausulId][$currentLevel]) ? $advice[$currentKlausulId][$currentLevel] : 'Skor level kurang dari 15%. Level berikutnya pada klausul ini dikunci.';
            // Simpan max level yang boleh diakses pada klausul ini
            $lockedKlausulLevel = session('locked_klausul_level', []);
            // Simpan max level yang boleh diakses (boleh edit sampai level ini, setelahnya terkunci)
            $lockedKlausulLevel[$currentKlausulId] = $currentLevel;
            session(['locked_klausul_level' => $lockedKlausulLevel]);
            return redirect()->route('project.levelList', $project->id)
                ->with('error', $pesan);
        } else {
            // Jika skor >= 15%, lanjut ke level berikutnya pada klausul yang sama
            $nextLevel = \App\Models\Level::where('klausul_id', $currentKlausulId)
                ->where('level', '>', $currentLevel)
                ->orderBy('level', 'asc')
                ->first();
            if ($nextLevel) {
                return redirect()->route('project.auditLevel', [$project->id, $nextLevel->id])
                    ->with('success', 'Lanjut ke level berikutnya.');
            } else {
                // Jika tidak ada level berikutnya, lanjut ke klausul berikutnya (level 2)
                $currentKlausulIndex = array_search($currentKlausulId, $selectedKlausuls);
                $nextKlausulId = $selectedKlausuls[$currentKlausulIndex + 1] ?? null;
                if ($nextKlausulId) {
                    $nextLevel2 = \App\Models\Level::where('klausul_id', $nextKlausulId)->where('level', 2)->first();
                    if ($nextLevel2) {
                        return redirect()->route('project.auditLevel', [$project->id, $nextLevel2->id])
                            ->with('success', 'Lanjut ke klausul berikutnya.');
                    }
                }
                // Jika tidak ada klausul berikutnya, selesai
                return redirect()->route('project.levelList', $project->id)
                    ->with('success', 'Audit selesai. Semua klausul sudah diaudit.');
            }
        }
    }

    public function downloadPdf($id)
    {
        $project = Project::with(['auditAnswers.level.klausul', 'auditAnswers.question'])->findOrFail($id);
        // Data untuk PDF
        $totals = [];
        $auditedAnswers = $project->auditAnswers;

        // Group by klausul_id and get the highest level audited for each klausul
        $klausulLevelMap = [];
        if ($auditedAnswers) {
            foreach ($auditedAnswers as $answer) {
                $klausulId = $answer->klausul_id;
                $levelNum = $answer->level->level ?? 0;
                if (!isset($klausulLevelMap[$klausulId]) || $levelNum > $klausulLevelMap[$klausulId]) {
                    $klausulLevelMap[$klausulId] = $levelNum;
                }
            }
        }
        // For per-level score (same as before)
        $levels = $auditedAnswers ? $auditedAnswers->groupBy('level_id') : [];
        foreach ($levels as $levelId => $answers) {
            $count = count($answers);
            $score = $count > 0 ? (collect($answers)->sum('jawaban') / $count) * 100 : 0;
            $totals[$levelId] = $score;
        }
        // Calculate global recap score as per formula
        $totalKlausul = count($klausulLevelMap);
        $sumLevel = array_sum($klausulLevelMap);
        $globalRecap = $totalKlausul > 0 ? ($sumLevel / $totalKlausul) : 0;
        $pdf = FacadePdf::loadView('project.report_pdf', compact('project', 'totals', 'globalRecap'));
        return $pdf->download('report_project_'.$project->id.'.pdf');
    }

    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();
        return redirect()->route('project.index')->with('success', 'Project berhasil dihapus');
    }
}
