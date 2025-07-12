@extends('layouts.master')
@section('title')
Edit Pertanyaan
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Edit Pertanyaan</div>
                <div class="card-body">
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <form action="{{ route('question.update', $question->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="mb-3">
                            <label for="level_id" class="form-label">Level</label>
                            <select name="level_id" id="level_id" class="form-control" required>
                                @foreach($levels as $level)
                                    <option value="{{ $level->id }}" {{ $question->level_id == $level->id ? 'selected' : '' }}>{{ $level->level }} (Klausul: {{ $level->klausul->nama_klausul ?? '-' }})</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="pertanyaan" class="form-label">Pertanyaan</label>
                            <textarea name="pertanyaan" id="pertanyaan" class="form-control" required>{{ $question->pertanyaan }}</textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                        <a href="{{ route('question.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
