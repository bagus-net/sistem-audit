@extends('layouts.master')
@section('title')
@lang('Edit Klausul')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Edit Klausul</h2>
        </div>
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="card">
            <div class="card-body">
                <form action="{{ route('klausul.update', $klausul->id) }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="kode_klausul" class="form-label">Kode Klausul</label>
                        <input type="text" name="kode_klausul" id="kode_klausul" class="form-control" maxlength="10" value="{{ $klausul->kode_klausul }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="nama_klausul" class="form-label">Nama Klausul</label>
                        <input type="text" name="nama_klausul" id="nama_klausul" class="form-control" maxlength="255" value="{{ $klausul->nama_klausul }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi</label>
                        <textarea name="deskripsi" id="deskripsi" class="form-control">{{ $klausul->deskripsi }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Perbarui</button>
                    <a href="{{ route('klausul.index') }}" class="btn btn-secondary">Batal</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
