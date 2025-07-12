@extends('layouts.master')
@section('title')
Project
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Buat Project Audit</div>
                <div class="card-body">
                    <form action="{{ route('project.store') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="nama_project" class="form-label">Nama Project</label>
                            <input type="text" name="nama_project" id="nama_project" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="auditor" class="form-label">Auditor</label>
                            <input type="text" name="auditor" id="auditor" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pilih Klausul</label>
                            <select name="klausul_id[]" class="form-control" multiple required>
                                @foreach($klausuls as $klausul)
                                    <option value="{{ $klausul->id }}">{{ $klausul->nama_klausul }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pilih Level</label>
                            <select name="level_id[]" class="form-control" multiple required>
                                @foreach(App\Models\Level::all() as $level)
                                    <option value="{{ $level->id }}">Level {{ $level->level }} ({{ $level->klausul->nama_klausul ?? '-' }})</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Lanjut Audit</button>
                        <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
