
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
            @foreach($totals as $levelId => $score)
                @php
                    $levelObj = $project->auditAnswers->where('level_id', $levelId)->first()->level ?? null;
                    $klausulName = $levelObj && $levelObj->klausul ? $levelObj->klausul->nama_klausul : '-';
                    $levelName = $levelObj ? $levelObj->level : $levelId;
                    if ($score <= 15) {
                        $skala = 'N';
                        $desc = 'Tidak Tercapai. Tidak terdapat aktivitas yang dilakukan dalam mencapai tujuan bisnis.';
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
                @endphp
                @if($skala == 'L' || $skala == 'F')
                <tr>
                    <td>{{ $klausulName }}</td>
                    <td style="text-align:center;">{{ $levelName }}</td>
                    <td>{{ $desc }}</td>
                </tr>
                @endif
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
                <th style="text-align:center;">Saran</th>
            </tr>
        </thead>
        <tbody>
            @php
                // Mapping for maturity level and suggestions
                $maturityLevels = [
                    0 => ['label' => 'Incomplete', 'saran' => 'Pekerjaan mungkin atau mungkin tidak diselesaikan untuk mencapai tujuan tata kelola dan sasaran manajemen di bidang fokus.'],
                    1 => ['label' => 'Initial', 'saran' => 'Pekerjaan telah selesai, tetapi tujuan dan maksud utama dari area fokus belum sepenuhnya tercapai.'],
                    2 => ['label' => 'Managed', 'saran' => 'Perencanaan dan pengukuran kinerja dilakukan, meskipun belum secara standar'],
                    3 => ['label' => 'Defined', 'saran' => 'Standar perusahaan secara menyeluruh memberikan panduan di seluruh perusahaan.'],
                    4 => ['label' => 'Quantitative', 'saran' => 'Perusahaan ini berorientasi pada data, dengan peningkatan kinerja yang berbasis kuantitatif.'],
                    5 => ['label' => 'Optimizing', 'saran' => 'Perusahaan ini berfokus pada perbaikan berkelanjutan.'],
                ];
                // Ambil hanya level dengan skor > 50% (L/F)
                $validLevels = [];
                foreach($totals as $levelId => $score) {
                    if ($score > 50) {
                        $levelObj = $project->auditAnswers->where('level_id', $levelId)->first()->level ?? null;
                        if ($levelObj) {
                            $validLevels[] = $levelObj->level;
                        }
                    }
                }
                // Gunakan grandTotalRaw dan grandTotal dari controller
                $rentangNilai = isset($grandTotalRaw) ? number_format($grandTotalRaw, 2) : '0.00';
                $nilaiMaturity = isset($grandTotal) ? $grandTotal : 0;
                $levelMaturity = $maturityLevels[$nilaiMaturity]['label'] ?? '-';
                $saran = $maturityLevels[$nilaiMaturity]['saran'] ?? '-';
            @endphp
            <tr>
                <td style="text-align:center;">{{ $rentangNilai }}</td>
                <td style="text-align:center;">{{ $nilaiMaturity }}</td>
                <td style="text-align:center;">{{ $levelMaturity }}</td>
                <td>{{ $saran }}</td>
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
