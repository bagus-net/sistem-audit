@extends('layouts.master')
@section('title')
Daftar Project Audit
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-10">
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
                <div class="card-header">Daftar Project</div>
                <div class="card-body">
                    @php $role = auth()->user()->role ?? null; @endphp
                    @if($role == '1' || $role == '2')
                        <a class="btn btn-success mb-3" href="{{ route('project.create') }}">Tambah Project</a>
                    @endif
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Project</th>
                                <th>User</th>
                                <th>Klausul</th>
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
                                    @foreach($project->klausuls as $klausul)
                                        <span class="badge bg-info text-light mb-1"> {{ $klausul->nama_klausul }}</span>
                                    @endforeach
                                </td>
                                <td>
                                    <a href="{{ route('project.show', $project->id) }}" class="btn btn-primary btn-sm" title="View">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    @if($role != '3')
                                    <a href="{{ route('project.levelList',$project->id) }}" class="btn btn-info btn-sm" title="Audit">
                                        <i class="fa fa-clipboard-check"></i>
                                    </a>
                                    @endif
                                    <a href="{{ route('project.downloadPdf', $project->id) }}" class="btn btn-success btn-sm" title="Download Report PDF">
                                        <i class="fa fa-file-pdf"></i>
                                    </a>
                                    @if($role == '1')
                                    <form action="{{ route('project.destroy', $project->id) }}" method="POST" style="display:inline-block;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-outline-danger btn-sm" title="Hapus" onclick="return confirm('Yakin hapus project ini?')">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                    @endif
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
