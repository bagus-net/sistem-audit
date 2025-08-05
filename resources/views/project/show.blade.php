@extends('layouts.master')
@section('title')
Hasil Audit Project
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">Hasil Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    <button class="btn btn-outline-primary mb-2" type="button" id="toggleTableBtn" onclick="toggleAuditTable()">Sembunyikan Tabel Audit</button>
                    <div id="auditTableWrapper">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Klausul</th>
                                    <th>Sub Proses</th>
                                    <th class="text-center">Level</th>
                                    <th>Pertanyaan</th>
                                    <th class="text-center">Jawaban</th>
                                    <th>Bukti Hasil Kerja</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($filteredAnswers as $answer)
                                <tr>
                                    <td>{{ $answer->klausul->nama_klausul ?? '-' }}</td>
                                    <td style="white-space: pre-line;">{{ $answer->level->sub_proses ?? '-' }}</td>
                                <td class="text-center">{{ $answer->level->level ?? '-' }}</td>
                                    <td>{{ $answer->question->pertanyaan ?? '-' }}</td>
                                <td class="text-center">{{ $answer->jawaban == 1 ? 'Y' : 'N' }}</td>
                                    <td>{{ $answer->bukti_hasil_kerja }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <script>
                        function toggleAuditTable() {
                            var wrapper = document.getElementById('auditTableWrapper');
                            var btn = document.getElementById('toggleTableBtn');
                            if (wrapper.style.display === 'none') {
                                wrapper.style.display = '';
                                btn.innerText = 'Sembunyikan Tabel Audit';
                            } else {
                                wrapper.style.display = 'none';
                                btn.innerText = 'Tampilkan Tabel Audit';
                            }
                        }
                    </script>
                    {{-- <div class="alert alert-info">
                        <strong>Total Audit: </strong> {{ number_format($total, 2) }}%
                    </div> --}}
                    <div class="row">
                        <div class="col-md-6">
                            <div class="alert alert-info">
                                <strong>Total Audit Per Klausul:</strong><br>
                                <ul>
                                @foreach($totals as $levelId => $score)
                                    @if($score > 50)
                                        @php
                                            $levelObj = $project->auditAnswers->where('level_id', $levelId)->first()->level ?? null;
                                            $klausulName = $levelObj && $levelObj->klausul ? $levelObj->klausul->nama_klausul : '-';
                                            $levelName = $levelObj ? $levelObj->level : $levelId;
                                            // Skala dan pernyataan
                                            if ($score <= 15) {
                                                $skala = 'N';
                                                $desc = 'Not Achieved (Tidak Tercapai). Tidak terdapat aktivitas yang dilakukan dalam mencapai tujuan bisnis.';
                                            } elseif ($score <= 50) {
                                                $skala = 'P';
                                                $desc = 'Partially Achieved (Sebagian Kecil Tercapai). Ada beberapa bukti pendekatan dan proses yang dinilai. Beberapa atribut pencapaian kinerja mungkin tidak dapat diprediksi.';
                                            } elseif ($score <= 85) {
                                                $skala = 'L';
                                                $desc = 'Largely Achieved (Sebagian Besar Tercapai). Proses TI sudah diimplementasikan namun ada beberapa yang harus diperbaiki.';
                                            } else {
                                                $skala = 'F';
                                                $desc = 'Fully Achieved (Secara Keseluruhan Tercapai). Proses telah diimplementasikan dan dikelola dengan baik, berada pada tingkat yang matang.';
                                            }
                                        @endphp
                                        <li><strong>{{ $klausulName }}</strong> - Level {{ $levelName }}: <strong>{{ number_format($score, 2) }}%</strong><br>
                                            <span class="badge bg-primary">Skala: {{ $skala }}</span> <br>
                                            <em>{{ $desc }}</em>
                                        </li>
                                    @endif
                                @endforeach
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="alert alert-success">
                                <strong>Skor Maturity:</strong> <br>
                                @php
                                    // Hitung level terakhir tiap klausul
                                    $lastLevels = [];
                                    foreach($project->auditAnswers as $answer) {
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
                                    $grandTotalRaw = $levelCount > 0 ? ($levelSum / $levelCount) : 0;
                                    // Pembulatan ke rentang maturity
                                    if ($grandTotalRaw <= 0.50) {
                                        $nilaiMaturity = 0;
                                        $levelMaturity = 'Incomplete';
                                    } elseif ($grandTotalRaw <= 1.50) {
                                        $nilaiMaturity = 1;
                                        $levelMaturity = 'Initial';
                                    } elseif ($grandTotalRaw <= 2.50) {
                                        $nilaiMaturity = 2;
                                        $levelMaturity = 'Managed';
                                    } elseif ($grandTotalRaw <= 3.50) {
                                        $nilaiMaturity = 3;
                                        $levelMaturity = 'Defined';
                                    } elseif ($grandTotalRaw <= 4.50) {
                                        $nilaiMaturity = 4;
                                        $levelMaturity = 'Quantitative';
                                    } else {
                                        $nilaiMaturity = 5;
                                        $levelMaturity = 'Optimizing';
                                    }
                                @endphp
                                <span style="font-size:1.5em"><strong>{{ number_format($grandTotalRaw, 2) }}</strong></span>
                                <div class="mt-2">
                                    <strong>Nilai Maturity:</strong> {{ $nilaiMaturity }}<br>
                                    <strong>Level Maturity:</strong> {{ $levelMaturity }}
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
