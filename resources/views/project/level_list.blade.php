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
                <div class="card-header">Pilih Level untuk Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Klausul</th>
                                <th>Level</th>
                                <th>Sub Proses</th>
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
                                <td>
                                    <a href="{{ route('project.auditLevel', [$project->id, $level->id]) }}" class="btn btn-primary btn-sm">Audit Level Ini</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
