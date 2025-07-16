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
                <div class="card-header">Pilih Level untuk Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
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
                                    <th>No</th>
                                    <th>Klausul</th>
                                    <th>Sub Proses</th>
                                    <th>Level</th>
                                    <th>Skor (%)</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($levels as $level)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $level->klausul->nama_klausul ?? '-' }}</td>
                                    <td style="white-space: pre-line;">{{ $level->sub_proses }}</td>
                                    <td>{{ $level->level }}</td>
                                    <td>{{ number_format($levelScores[$level->id], 2) }}</td>
                                    <td>
                                        @php
                                            $isLocked = false;
                                            $maxAllowed = isset($lockedKlausulLevel[$level->klausul_id]) ? $lockedKlausulLevel[$level->klausul_id] : null;
                                            if ($maxAllowed !== null && $level->level > $maxAllowed) {
                                                $isLocked = true;
                                            }
                                        @endphp
                                        @if($isLocked)
                                            <button class="btn btn-secondary btn-sm" title="Level terkunci" disabled>
                                                <i class="fa fa-lock"></i> Terkunci
                                            </button>
                                        @elseif(in_array($level->id, $auditedLevelIds))
                                            <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-warning btn-sm" title="Edit Audit">
                                                <i class="fa fa-pencil-alt"></i>
                                            </a>
                                        @else
                                            <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-primary btn-sm" title="Audit Level Ini">
                                                <i class="fa fa-clipboard-check"></i>
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="text-end">
                            <button type="submit" class="btn btn-success">Simpan Hasil Audit</button>
                        </div>
                    </form>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
