@extends('layouts.master')
@section('title')
Daftar Project Audit
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">Daftar Project Audit</div>
                <div class="card-body">
                    <a class="btn btn-success mb-3" href="{{ route('project.create') }}">Tambah Project</a>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Project</th>
                                <th>Auditor</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($projects as $project)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $project->nama_project }}</td>
                                <td>{{ $project->auditor }}</td>
                                <td>
                                    <a href="{{ route('project.audit', $project->id) }}" class="btn btn-info btn-sm">Audit</a>
                                    <a href="{{ route('project.show', $project->id) }}" class="btn btn-primary btn-sm">Lihat Hasil</a>
                                    <a href="{{ route('project.downloadPdf', $project->id) }}" class="btn btn-danger btn-sm">Download Report PDF</a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
