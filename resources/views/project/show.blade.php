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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Klausul</th>
                                <th>Level</th>
                                <th>Sub Proses</th>
                                <th>Pertanyaan</th>
                                <th>Jawaban</th>
                                <th>Bukti Hasil Kerja</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($project->auditAnswers as $answer)
                            <tr>
                                <td>{{ $answer->klausul->nama_klausul ?? '-' }}</td>
                                <td>{{ $answer->level->level ?? '-' }}</td>
                                <td style="white-space: pre-line;">{{ $answer->level->sub_proses ?? '-' }}</td>
                                <td>{{ $answer->question->pertanyaan ?? '-' }}</td>
                                <td>{{ $answer->jawaban == 1 ? 'Y' : 'N' }}</td>
                                <td>{{ $answer->bukti_hasil_kerja }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="alert alert-info">
                        <strong>Total Audit: </strong> {{ number_format($total, 2) }}%
                    </div>
                    @php
                        $grandTotal = count($totals) > 0 ? (array_sum($totals) / count($totals)) : 0;
                    @endphp
                    <div class="row">
                        <div class="col-md-6">
                            <div class="alert alert-info">
                                <strong>Total Audit Per Level:</strong><br>
                                <ul>
                                @foreach($totals as $levelId => $score)
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
                                @endforeach
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="alert alert-success">
                                <strong>Total Nilai Semua Level:</strong> <span style="font-size:1.2em">{{ number_format($grandTotal, 2) }}%</span>
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
