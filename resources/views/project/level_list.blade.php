@extends('layouts.master')
@section('title')
Pilih Level Audit
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif
            <div class="card">
                {{-- ALERTS DIHILANGKAN SESUAI PERMINTAAN --}}
                <div class="card-header">Pilih Level untuk Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    {{-- <div class="alert alert-info" style="font-size: 15px;">
                        <b>Catatan:</b> Hanya level 2 pada klausul pertama yang terbuka. Untuk memulai audit, tekan tombol <b>Audit</b> pada kolom Aksi.
                    </div> --}}
                    @php
    // Hitung skor per level
    $levelScores = [];
    $lockedKlausulLevel = session('locked_klausul_level', []);
    foreach($levels as $level) {
        $answers = \App\Models\AuditAnswer::where('project_id', $project->id)->where('level_id', $level->id)->get();
        $count = $answers->count();
        $score = $count > 0 ? ($answers->sum('jawaban') / $count) * 100 : 0;
        $levelScores[$level->id] = $score;
    }
@endphp
                    <form action="{{ route('project.show', $project->id) }}" method="GET">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Klausul</th>
                                    <th>Sub Proses</th>
                                    <th class="text-center">Level</th>
                                    <th class="text-center">Skor & Skala (%)</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($levels as $level)
                                <tr>
                                    <td class="text-center">{{ $loop->iteration }}</td>
                                    <td>{{ $level->klausul->nama_klausul ?? '-' }}</td>
                                    <td style="white-space: pre-line;">{{ $level->sub_proses }}</td>
                                    <td class="text-center">{{ $level->level }}</td>
                                    <td class="text-center">
                                        {{ number_format($levelScores[$level->id], 2) }}
                                        @php
                                            $score = $levelScores[$level->id];
                                            if ($score <= 15) {
                                                $skala = 'N';
                                            } elseif ($score <= 50) {
                                                $skala = 'P';
                                            } elseif ($score <= 85) {
                                                $skala = 'L';
                                            } else {
                                                $skala = 'F';
                                            }
                                        @endphp
                                        <span class="badge bg-primary">{{ $skala }}</span>
                                    </td>
                                    <td>
                                        @php
                                            $isLocked = false;
                                            $lockInfo = isset($lockedKlausulLevel[$level->klausul_id]) ? $lockedKlausulLevel[$level->klausul_id] : null;
                                            if (!in_array($level->id, $auditedLevelIds)) {
                                                if (is_array($lockInfo) && in_array($level->level, $lockInfo)) {
                                                    $isLocked = true;
                                                } elseif (is_int($lockInfo) && $level->level > $lockInfo) {
                                                    $isLocked = true;
                                                }
                                            }
                                        @endphp
                                        @if($isLocked)
                                            <button class="btn btn-secondary btn-sm" title="Level terkunci" disabled>
                                                <i class="fa fa-lock"></i> Terkunci
                                            </button>
                                        @else
                                            @if(in_array($level->id, $auditedLevelIds))
                                                <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-warning btn-sm" title="Edit Audit">
                                                    <i class="fa fa-pencil-alt"></i>
                                                </a>
                                            @else
                                                <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-primary btn-sm" title="Audit Level Ini">
                                                    <i class="fa fa-clipboard-check"></i>
                                                </a>
                                            @endif
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="text-end">
                            <button type="submit" class="btn btn-success">Simpan</button>
                        </div>
                    </form>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
