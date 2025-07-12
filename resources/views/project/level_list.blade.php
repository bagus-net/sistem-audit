@extends('layouts.master')
@section('title')
Pilih Level Audit
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
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
                                    <th>Level</th>
                                    <th>Sub Proses</th>
                                    <th>Skor (%)</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($levels as $level)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $level->klausul->nama_klausul ?? '-' }}</td>
                                    <td>{{ $level->level }}</td>
                                    <td style="white-space: pre-line;">{{ $level->sub_proses }}</td>
                                    <td>{{ number_format($levelScores[$level->id], 2) }}</td>
                                    <td>
                                        @if(in_array($level->id, $auditedLevelIds))
                                            <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-warning btn-sm">Edit Audit</a>
                                        @else
                                            <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-primary btn-sm">Audit Level Ini</a>
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
