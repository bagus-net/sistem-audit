    <br>
    {{-- Rekomendasi/penjelasan maturity singkat --}}
    @php
        $maturityExplanations = [
            1 => ' proses layanan TI sudah dijalankan namun masih bersifat reaktif dan belum terstruktur.',
            2 => ' proses layanan TI mulai direncanakan, dilaksanakan, dan didokumentasikan, tetapi konsistensi penerapannya belum optimal.',
            3 => ' proses layanan TI sudah memiliki pedoman tertulis dan dilaksanakan secara konsisten di seluruh perusahaan.',
            4 => ' proses layanan TI telah dipantau dan dievaluasi dengan ukuran kinerja yang jelas sehingga kinerjanya dapat diprediksi dan dikendalikan.',
            5 => ' proses layanan TI terus ditingkatkan secara berkelanjutan melalui inovasi dan analisis hasil pengukuran kinerja.',
        ];
        $rekomendasi = '';
        if (!empty($nilaiMaturity) && isset($maturityExplanations[$nilaiMaturity])) {
            $rekomendasi = $maturityExplanations[$nilaiMaturity];
        }
    @endphp
    @if($rekomendasi)
    <div style="margin: 20px 0; padding: 15px; background: #e9f7ef; border: 1px solid #b2dfdb; border-radius: 6px;">
        <strong>Rekomendasi:</strong><br>
        {{ $rekomendasi }}
    </div>
    @endif
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Report Audit Project</title>
    <style>
        body { font-family: Arial, sans-serif; font-size: 12px; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { border: 1px solid #333; padding: 6px; text-align: left; }
        th { background: #eee; }
        .title { text-align: center; font-size: 16px; font-weight: bold; margin-bottom: 10px; }
        .subtitle { text-align: center; font-size: 14px; margin-bottom: 20px; }
        .section-title { font-weight: bold; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="title">Lembar Kerja Audit Project TI</div>
    <div class="subtitle">Nama Project: {{ $project->nama_project }}<br>Auditor: {{ $project->auditor }}</div>
        <div class="section-title">Hasil Audit Per Level</div>
    <table>
        <thead>
            <tr>
                <th style="text-align:center;">No</th>
                <th>Klausul</th>
                <th>Sub Proses</th>
                <th style="text-align:center;">Level</th>
                <th>Pertanyaan</th>
                <th style="text-align:center;">Jawaban</th>
                <th>Bukti Hasil Kerja</th>
            </tr>
        </thead>
        <tbody>
            @php $no = 1; @endphp
            @foreach($project->auditAnswers as $answer)
                <tr>
                    <td style="text-align:center;">{{ $no++ }}</td>
                    <td>{{ $answer->level->klausul->nama_klausul ?? '-' }}</td>
                    <td style="white-space: pre-line;">{{ $answer->level->sub_proses ?? '-' }}</td>
                    <td style="text-align:center;">{{ $answer->level->level ?? '-' }}</td>
                    <td>{{ $answer->question->pertanyaan ?? '-' }}</td>
                    <td style="text-align:center;">{{ $answer->jawaban == 1 ? 'Y' : 'N' }}</td>
                    <td>{{ $answer->bukti_hasil_kerja }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="section-title"><center>Total Audit Per Klausul</center></div>
    <br>
    <table>
        <thead>
            <tr>
                <th>Klausul</th>
                <th style="text-align:center;">Level</th>
                <th>Deskripsi</th>
            </tr>
        </thead>
        <tbody>
            @php
                // Ambil level tertinggi per klausul yang skornya > 15, jika tidak ada, ambil level tertinggi apapun
                $klausulLevels = [];
                foreach($project->auditAnswers as $answer) {
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
                            'score' => $score
                        ];
                    }
                }
                $filteredLevels = [];
                $lastLevels = [];
                $levelStandar = 85;
                foreach ($klausulLevels as $klausulId => $levels) {
                    // Urutkan level dari terbesar ke terkecil
                    krsort($levels);
                    $foundLevel = null;
                    $hasLevel1 = isset($levels[1]);
                    $hasLevel2 = isset($levels[2]);
                    // Jika hanya ada level 2 dan nilainya <= 85, tambahkan dummy level 1
                    if (!$hasLevel1 && $hasLevel2 && $levels[2]['score'] <= 85) {
                        $dummyLevel1 = [
                            'level' => 1,
                            'levelObj' => null,
                            'score' => 0,
                            'is_dummy' => true
                        ];
                        $levels[1] = $dummyLevel1;
                        krsort($levels);
                    }
                    foreach ($levels as $data) {
                        if ($data['score'] > $levelStandar) {
                            $foundLevel = $data;
                            break;
                        }
                    }
                    if (!$foundLevel && count($levels) > 0) {
                        // Ambil level terkecil jika semua <= 50%
                        $minLevel = null;
                        $minData = null;
                        foreach ($levels as $data) {
                            if ($minLevel === null || $data['level'] < $minLevel) {
                                $minLevel = $data['level'];
                                $minData = $data;
                            }
                        }
                        $foundLevel = $minData;
                    }
                    if ($foundLevel) {
                        $filteredLevels[$klausulId] = $foundLevel;
                        $lastLevels[$klausulId] = $foundLevel;
                    }
                }
            @endphp
            @foreach($filteredLevels as $klausulId => $data)
                @php
                    $levelObj = $data['levelObj'];
                    // Jika dummy, ambil nama klausul dari salah satu level lain di klausul yang sama
                    if ($data['is_dummy'] ?? false) {
                        $levelName = 1;
                        // Cari nama klausul dari salah satu level di klausulLevels
                        $klausulName = isset($klausulLevels[$klausulId][2]['levelObj']->klausul->nama_klausul) ? $klausulLevels[$klausulId][2]['levelObj']->klausul->nama_klausul : '-';
                        $score = 0;
                        $desc = 'Tidak Tercapai. Tidak ada aktivitas yang dilakukan dalam mencapai tujuan bisnis.';
                    } else {
                        $klausulName = $levelObj && $levelObj->klausul ? $levelObj->klausul->nama_klausul : '-';
                        $levelName = $levelObj ? $levelObj->level : '-';
                        $score = $data['score'];
                        if ($score <= 15) {
                            continue; // skip baris ini
                        } elseif ($score <= 50) {
                            $skala = 'P';
                            $desc = 'Sebagian Kecil Tercapai. Ada beberapa bukti pendekatan dan proses yang dinilai. Beberapa atribut pencapaian kinerja mungkin tidak dapat diprediksi.';
                        } elseif ($score <= 85) {
                            $skala = 'L';
                            $desc = 'Sebagian Besar Tercapai. Proses TI sudah diimplementasikan namun ada beberapa yang harus diperbaiki.';
                        } else {
                            $skala = 'F';
                            $desc = 'Secara Keseluruhan Tercapai. Proses telah diimplementasikan dan dikelola dengan baik, berada pada tingkat yang matang.';
                        }
                    }
                @endphp
                <tr>
                    <td>{{ $klausulName }}</td>
                    <td style="text-align:center;">{{ $levelName }}</td>
                    <td>{{ $desc }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="section-title"><center>Total Nilai Maturity:</center></div>
    <br>
    <table>
        <thead>
            <tr>
                <th style="text-align:center;">Rentang Nilai</th>
                <th style="text-align:center;">Nilai Maturity</th>
                <th style="text-align:center;">Level Maturity</th>
            </tr>
        </thead>
        <tbody>
            @php
                // Mapping for maturity level and suggestions
                $maturityLevels = [
                    0 => ['label' => 'Incomplete', 'Penjelasan' => 'Pekerjaan mungkin atau mungkin tidak diselesaikan untuk mencapai tujuan tata kelola dan sasaran manajemen di bidang fokus.'],
                    1 => ['label' => 'Initial', 'Penjelasan' => 'Pekerjaan telah selesai, tetapi tujuan dan maksud utama dari area fokus belum sepenuhnya tercapai.'],
                    2 => ['label' => 'Managed', 'Penjelasan' => 'Perencanaan dan pengukuran kinerja dilakukan, meskipun belum secara standar'],
                    3 => ['label' => 'Defined', 'Penjelasan' => 'Standar perusahaan secara menyeluruh memberikan panduan di seluruh perusahaan.'],
                    4 => ['label' => 'Quantitative', 'Penjelasan' => 'Perusahaan ini berorientasi pada data, dengan peningkatan kinerja yang berbasis kuantitatif.'],
                    5 => ['label' => 'Optimizing', 'Penjelasan' => 'Perusahaan ini berfokus pada perbaikan berkelanjutan.'],
                ];
                // Hitung nilai maturity dari level terakhir tiap klausul
                $levelSum = 0;
                $levelCount = count($lastLevels);
                foreach ($lastLevels as $klausulId => $data) {
                    $levelSum += $data['level'];
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
                $rentangNilai = number_format($grandTotalRaw, 2);
                if (floatval($rentangNilai) == 0) {
                    $nilaiMaturity = '';
                    $levelMaturity = '';
                    $saran = '';
                } else {
                    $nilaiMaturity = $grandTotal;
                    $levelMaturity = $maturityLevels[$nilaiMaturity]['label'] ?? '';
                    $saran = $maturityLevels[$nilaiMaturity]['Penjelasan'] ?? '';
                }
            @endphp
            <tr>
                <td style="text-align:center;">{{ $rentangNilai }}</td>
                <td style="text-align:center;">{{ $nilaiMaturity }}</td>
                <td style="text-align:center;">{{ $levelMaturity }}</td>
            </tr>
        </tbody>
    </table>
    @php
        $maturityImprovement = [
            1 => 'Perusahaan perlu mulai menyusun aturan dan pedoman formal terkait layanan teknologi informasi agar pelaksanaan proses memiliki dasar yang jelas dan terarah.',
            2 => 'Perusahaan perlu meningkatkan konsistensi penerapan layanan dengan memperkuat dokumentasi serta menerapkan standar yang sama di seluruh unit.',
            3 => 'Evaluasi dan penyempurnaan aturan serta pedoman layanan perlu dilakukan secara berkala untuk memastikan kesesuaian dengan kebutuhan perusahaan dan perkembangan teknologi.',
            4 => 'Perusahaan perlu mengembangkan pengukuran kinerja dengan indikator yang lebih menyeluruh, serta menganalisis hasil evaluasi secara sistematis untuk mendukung proses pengambilan keputusan yang tepat.',
            5 => 'Budaya perbaikan berkelanjutan perlu diperkuat melalui inovasi, penerapan praktik terbaik, dan pemanfaatan teknologi baru agar efektivitas serta kepuasan pengguna layanan meningkat.',
        ];
    @endphp
    <table style="margin-top:10px;">
        <thead>
            <tr>
                <th colspan="3" style="background:#46e96e; text-align:center; text color:#012E0CFF ;">Saran Perbaikan</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="3" style="text-align:center; background: #ff1f1f; color: #ffffff; font-weight: 500;">
                    @if($nilaiMaturity == 5)
                        Tidak ada
                    @elseif($nilaiMaturity && isset($maturityImprovement[$nilaiMaturity]))
                        {{ $maturityImprovement[$nilaiMaturity] }}
                    @else
                        -
                    @endif
                </td>
            </tr>
        </tbody>
    </table>
    <br><br>
    <table style="width:60%;margin:auto;">
        <thead>
            <tr>
                <th style="text-align:center;">Rentang Nilai</th>
                <th style="text-align:center;">Nilai Maturity</th>
                <th style="text-align:center;">Level Maturity</th>
            </tr>
        </thead>
        <tbody>
            <tr><td style="text-align:center;">0 - 0.50</td><td style="text-align:center;">0</td><td style="text-align:center;">Incomplete</td></tr>
            <tr><td style="text-align:center;">0.51 - 1.50</td><td style="text-align:center;">1</td><td style="text-align:center;">Initial</td></tr>
            <tr><td style="text-align:center;">1.51 - 2.50</td><td style="text-align:center;">2</td><td style="text-align:center;">Managed</td></tr>
            <tr><td style="text-align:center;">2.51 - 3.50</td><td style="text-align:center;">3</td><td style="text-align:center;">Defined</td></tr>
            <tr><td style="text-align:center;">3.51 - 4.50</td><td style="text-align:center;">4</td><td style="text-align:center;">Quantitative</td></tr>
            <tr><td style="text-align:center;">4.51 - 5.00</td><td style="text-align:center;">5</td><td style="text-align:center;">Optimizing</td></tr>
        </tbody>
    </table>
    <div style="text-align: center; font-size: 10px; margin-top: 40px;">
        Dicetak pada: {{ date('d-m-Y H:i') }}
    </div>
</body>
</html>
