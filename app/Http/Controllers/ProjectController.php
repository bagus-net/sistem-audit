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
        // Attach klausul ke project (isi tabel pivot)
        $project->klausuls()->attach($klausulIds);
        // Simpan klausul yang dipilih ke session
        session(['selected_klausuls' => $klausulIds]);
        // Setelah input project, langsung ke level list
        return redirect()->route('project.levelList', $project->id);
    }

    public function levelList($id)
    {
        $project = Project::findOrFail($id);
        $selectedKlausuls = session('selected_klausuls', []);
        $auditedLevelIds = [];
        $klausulIds = [];
        if (!empty($selectedKlausuls)) {
            $klausulIds = $selectedKlausuls;
        } else {
            $auditedLevelIds = AuditAnswer::where('project_id', $project->id)->pluck('level_id')->unique()->toArray();
            $auditedLevels = [];
            if (!empty($auditedLevelIds)) {
                $auditedLevels = \App\Models\Level::whereIn('id', $auditedLevelIds)->get();
                $klausulIds = $auditedLevels->pluck('klausul_id')->unique()->toArray();
            }
            if (empty($klausulIds)) {
                $klausulIds = \App\Models\Klausul::pluck('id')->toArray();
            }
        }
        $levels = \App\Models\Level::whereIn('klausul_id', $klausulIds)->with('klausul')->get();

        // Assign $hasAudit after $project and $klausulIds are set
        $hasAudit = AuditAnswer::where('project_id', $project->id)->exists();

        $lockedKlausulLevel = [];
        $skalaSkorL = 85;
        // Ambil semua level yang sudah pernah diaudit (selalu boleh di-audit ulang)
        $auditedLevelIds = AuditAnswer::where('project_id', $project->id)->pluck('level_id')->unique()->toArray();
        if (!$hasAudit) {
            // Belum ada audit sama sekali: hanya klausul terkecil dan level 2 yang open
            $firstKlausulId = min($klausulIds);
            foreach ($klausulIds as $kid) {
                $klausulLevels = $levels->where('klausul_id', $kid);
                foreach ($klausulLevels as $lvl) {
                    if (in_array($lvl->id, $auditedLevelIds)) continue; // Sudah pernah diaudit, jangan dikunci
                    if ($kid == $firstKlausulId) {
                        if ($lvl->level != 2) {
                            $lockedKlausulLevel[$kid][] = $lvl->level;
                        }
                    } else {
                        $lockedKlausulLevel[$kid][] = $lvl->level;
                    }
                }
            }
            session(['locked_klausul_level' => $lockedKlausulLevel]);
        } else {
            // Sudah ada audit: kunci level setelah gagal, tapi level yang sudah pernah diaudit tetap bisa diakses
            foreach ($klausulIds as $kid) {
                $klausulLevels = $levels->where('klausul_id', $kid);
                $maxFailed = null;
                foreach ($klausulLevels as $lvl) {
                    $answers = AuditAnswer::where('project_id', $project->id)->where('level_id', $lvl->id)->get();
                    $count = $answers->count();
                    $score = $count > 0 ? ($answers->sum('jawaban') / $count) * 100 : null;
                    if ($score !== null && $score <= $skalaSkorL) {
                        if ($maxFailed === null || $lvl->level > $maxFailed) {
                            $maxFailed = $lvl->level;
                        }
                    }
                }
                if ($maxFailed !== null) {
                    // Kunci level di atas maxFailed, tapi yang sudah pernah diaudit tetap bisa diakses
                    $klausulLevels = $levels->where('klausul_id', $kid);
                    foreach ($klausulLevels as $lvl) {
                        if ($lvl->level > $maxFailed && !in_array($lvl->id, $auditedLevelIds)) {
                            $lockedKlausulLevel[$kid][] = $lvl->level;
                        }
                    }
                }
            }
            // Tambahan: jika gagal di level 2 klausul saat ini, buka level 2 klausul berikutnya
            // Cek session error dari saveAuditLevel (jika ada)
            $error = session('error');
            if ($error && preg_match('/Level berikutnya pada klausul ini dikunci/', $error)) {
                // Cari klausul berikutnya
                $selectedKlausuls = session('selected_klausuls', []);
                $currentKlausulId = null;
                // Temukan klausul yang baru saja gagal (level berapapun yang baru saja di-audit)
                foreach ($klausulIds as $kid) {
                    $klausulLevels = $levels->where('klausul_id', $kid);
                    foreach ($klausulLevels as $lvl) {
                        if (in_array($lvl->id, $auditedLevelIds)) {
                            $currentKlausulId = $kid;
                            break 2;
                        }
                    }
                }
                if ($currentKlausulId && $selectedKlausuls) {
                    $currentKlausulIndex = array_search($currentKlausulId, $selectedKlausuls);
                    $nextKlausulId = $selectedKlausuls[$currentKlausulIndex + 1] ?? null;
                    if ($nextKlausulId) {
                        // Buka level 2 klausul berikutnya (jangan dikunci)
                        if (isset($lockedKlausulLevel[$nextKlausulId])) {
                            $lockedKlausulLevel[$nextKlausulId] = array_diff($lockedKlausulLevel[$nextKlausulId], [2]);
                            if (empty($lockedKlausulLevel[$nextKlausulId])) unset($lockedKlausulLevel[$nextKlausulId]);
                        }
                    }
                }
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
        // Only show answers for audited levels (not for levels that are not audited)
        $auditedLevelIds = [];
        foreach ($klausulLevelMap as $klausulId => $maxLevel) {
            $levelIds = \App\Models\Level::where('klausul_id', $klausulId)
                ->where('level', '<=', $maxLevel)
                ->pluck('id')->toArray();
            $auditedLevelIds = array_merge($auditedLevelIds, $levelIds);
        }
        $filteredAnswers = $auditedAnswers->whereIn('level_id', $auditedLevelIds);

        // For per-level score
        $totals = [];
        $levels = $filteredAnswers->groupBy('level_id');
        foreach ($levels as $levelId => $answers) {
            $count = count($answers);
            $score = $count > 0 ? (collect($answers)->sum('jawaban') / $count) * 100 : 0;
            $totals[$levelId] = $score;
        }

        // Perhitungan Nilai Maturity: jumlahkan level terakhir tiap klausul, bagi total klausul
        $lastLevels = [];
        foreach($auditedAnswers as $answer) {
            $levelObj = $answer->level;
            if ($levelObj && $levelObj->klausul_id) {
                $klausulId = $levelObj->klausul_id;
                if (!isset($lastLevels[$klausulId]) || $levelObj->level > $lastLevels[$klausulId]['level']) {
                    $lastLevels[$klausulId] = [
                        'level' => $levelObj->level,
                        'levelObj' => $levelObj,
                        'levelId' => $levelObj->id
                    ];
                }
            }
        }
        $levelSum = 0;
        $levelCount = count($lastLevels);
        foreach ($lastLevels as $klausulId => $data) {
            $levelSum += $data['level'];
        }
        $grandTotal = $levelCount > 0 ? ($levelSum / $levelCount) : 0;

        return view('project.show', [
            'project' => $project,
            'totals' => $totals,
            'total' => 0, // not used anymore
            'filteredAnswers' => $filteredAnswers,
            'grandTotal' => $grandTotal,
            'klausulLevelMap' => $klausulLevelMap,
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
        // Skala Skor F: <85% tidak bisa lanjut
        $skalaSkorL = 85;
        // Ambil klausul yang dipilih dari session
        $selectedKlausuls = session('selected_klausuls', []);
        // Urutkan klausul dan level
        $currentKlausulId = $level->klausul_id;
        $currentLevel = $level->level;
        // Cek apakah boleh lanjut ke level berikutnya atau ke klausul berikutnya
        if ($score < $skalaSkorL) {
            // Simpan max level yang boleh diakses pada klausul ini
            $lockedKlausulLevel = session('locked_klausul_level', []);
            if (!isset($lockedKlausulLevel[$currentKlausulId]) || $currentLevel > $lockedKlausulLevel[$currentKlausulId]) {
                $lockedKlausulLevel[$currentKlausulId] = $currentLevel;
            }

            // Jika pindah ke klausul berikutnya, pastikan level 2 klausul berikutnya terbuka (tidak dikunci)
            $currentKlausulIndex = array_search($currentKlausulId, $selectedKlausuls);
            $nextKlausulId = $selectedKlausuls[$currentKlausulIndex + 1] ?? null;
            if ($nextKlausulId) {
                if (isset($lockedKlausulLevel[$nextKlausulId])) {
                    $lockedKlausulLevel[$nextKlausulId] = array_diff((array)$lockedKlausulLevel[$nextKlausulId], [2]);
                    if (empty($lockedKlausulLevel[$nextKlausulId])) unset($lockedKlausulLevel[$nextKlausulId]);
                }
            }
            session(['locked_klausul_level' => $lockedKlausulLevel]);
            return redirect()->route('project.levelList', $project->id)
                ->with('error', 'Skor level tidak memenuhi syarat minimum. Level berikutnya pada klausul ini dikunci.');
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
        // Ambil level tertinggi per klausul yang skornya > 15, jika tidak ada, ambil level tertinggi apapun
        $lastLevels = [];
        if ($auditedAnswers) {
            $klausulLevels = [];
            foreach ($auditedAnswers as $answer) {
                $levelObj = $answer->level;
                if ($levelObj && $levelObj->klausul_id) {
                    $klausulId = $levelObj->klausul_id;
                    $score = $totals[$levelObj->id] ?? 0;
                    if (!isset($klausulLevels[$klausulId])) {
                        $klausulLevels[$klausulId] = [];
                    }
                    $klausulLevels[$klausulId][$levelObj->level] = [
                        'level' => $levelObj->level,
                        'levelObj' => $levelObj,
                        'score' => $score,
                        'levelId' => $levelObj->id
                    ];
                }
            }
            foreach ($klausulLevels as $klausulId => $levels) {
                krsort($levels);
                $found = false;
                foreach ($levels as $data) {
                    if ($data['score'] > 85) {
                        $lastLevels[$klausulId] = $data;
                        $found = true;
                        break;
                    }
                }
                if (!$found && count($levels) > 0) {
                    $lastLevels[$klausulId] = reset($levels);
                }
            }
        }
        // Hitung hanya yang lolos filter (score > 15)
        $levelSum = 0;
        $levelCount = 0;
        foreach ($lastLevels as $klausulId => $data) {
            if ($data['score'] > 85) {
                $levelSum += $data['level'];
                $levelCount++;
            }
        }
        $grandTotalRaw = $levelCount > 0 ? ($levelSum / $levelCount) : 0;
        // Pembulatan ke rentang maturity
        if ($grandTotalRaw <= 0.50) {
            $grandTotal = 0;
        } elseif ($grandTotalRaw <= 1.50) {
            $grandTotal = 1;
        } elseif ($grandTotalRaw <= 2.50) {
            $grandTotal = 2;
        } elseif ($grandTotalRaw <= 3.50) {
            $grandTotal = 3;
        } elseif ($grandTotalRaw <= 4.50) {
            $grandTotal = 4;
        } else {
            $grandTotal = 5;
        }
        $pdf = FacadePdf::loadView('project.report_pdf', compact('project', 'totals', 'grandTotal', 'grandTotalRaw'));
        $namaProject = trim(preg_replace('/[^A-Za-z0-9\-]/', '-', $project->nama_project), '-');
        $user = auth()->user() ? trim(preg_replace('/[^A-Za-z0-9\-]/', '-', auth()->user()->username), '-') : 'user';
        $tanggal = date('d-m-Y_H-i');
        $filename = $namaProject . ' - ' . $user . ' - ' . $tanggal . '.pdf';
        return $pdf->download($filename);
    }

    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();
        return redirect()->route('project.index')->with('success', 'Project berhasil dihapus');
    }
}
