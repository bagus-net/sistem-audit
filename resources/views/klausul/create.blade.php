@extends('layouts.master')
@section('title')
@lang('Tambah Klausul')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Tambah Klausul Baru</h2>
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
                <form action="{{ route('klausul.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="kode_klausul" class="form-label">Kode Klausul</label>
                        <input type="text" name="kode_klausul" id="kode_klausul" class="form-control" maxlength="10" value="{{ old('kode_klausul') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="nama_klausul" class="form-label">Nama Klausul</label>
                        <input type="text" name="nama_klausul" id="nama_klausul" class="form-control" maxlength="255" value="{{ old('nama_klausul') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi</label>
                        <textarea name="deskripsi" id="deskripsi" class="form-control">{{ old('deskripsi') }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <a href="{{ route('klausul.index') }}" class="btn btn-secondary">Batal</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
