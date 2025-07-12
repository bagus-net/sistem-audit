@extends('layouts.master')
@section('title')
Edit Level
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Edit Level</div>
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
                    <form action="{{ route('level.update', $level->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="mb-3">
                            <label for="klausul_id" class="form-label">Klausul</label>
                            <select name="klausul_id" id="klausul_id" class="form-control" required>
                                @foreach($klausuls as $klausul)
                                    <option value="{{ $klausul->id }}" {{ $level->klausul_id == $klausul->id ? 'selected' : '' }}>{{ $klausul->nama_klausul }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="level" class="form-label">Level</label>
                            <input type="number" name="level" id="level" class="form-control" min="2" max="5" value="{{ $level->level }}" required>
                        </div>
                        <div class="mb-3">
                            <label for="sub_proses" class="form-label">Sub Proses</label>
                            <textarea name="sub_proses" id="sub_proses" class="form-control">{{ old('sub_proses', $level->sub_proses) }}</textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                        <a href="{{ route('level.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
