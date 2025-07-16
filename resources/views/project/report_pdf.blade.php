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
                <th>No</th>
                <th>Klausul</th>
                <th>Sub Proses</th>
                <th>Level</th>
                <th>Pertanyaan</th>
                <th>Jawaban</th>
                <th>Bukti Hasil Kerja</th>
            </tr>
        </thead>
        <tbody>
            @foreach($project->auditAnswers as $i => $answer)
            <tr>
                <td>{{ $i+1 }}</td>
                <td>{{ $answer->level->klausul->nama_klausul ?? '-' }}</td>
                <td style="white-space: pre-line;">{{ $answer->level->sub_proses ?? '-' }}</td>
                <td>{{ $answer->level->level ?? '-' }}</td>
                <td>{{ $answer->question->pertanyaan ?? '-' }}</td>
                <td>{{ $answer->jawaban == 1 ? 'Y' : 'N' }}</td>
                <td>{{ $answer->bukti_hasil_kerja }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <div class="section-title">Total Audit Per Level</div>
    <table>
        <thead>
            <tr>
                <th>Klausul</th>
                <th>Level</th>
                <th>Skor</th>
                <th>Kategori</th>
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
                <tr>
                    <td>{{ $klausulName }}</td>
                    <td>{{ $levelName }}</td>
                    <td>{{ number_format($score, 2) }}%</td>
                    <td>{{ $skala }}</td>
                    <td>{{ $desc }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div class="section-title">Total Global</div>
    <table>
        <tr>
            <th>Nilai Global</th>
            <td><strong>{{ number_format($globalRecap, 2) }}</strong></td>
        </tr>
    </table>
    <div style="text-align: center; font-size: 10px; margin-top: 40px;">
        Dicetak pada: {{ date('d-m-Y H:i') }}
    </div>
</body>
</html>
