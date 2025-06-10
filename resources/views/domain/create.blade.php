@extends('layouts.master')
@section('title')
@lang('Create Domain')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Tambah Domain Baru</h2>
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
                <form action="{{ route('domain.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="kode_domain" class="form-label">Kode Domain</label>
                        <input type="text" name="kode_domain" id="kode_domain" class="form-control" maxlength="5" value="{{ old('kode_domain') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="nama_domain" class="form-label">Nama Domain</label>
                        <input type="text" name="nama_domain" id="nama_domain" class="form-control" maxlength="255" value="{{ old('nama_domain') }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi</label>
                        <textarea name="deskripsi" id="deskripsi" class="form-control">{{ old('deskripsi') }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <a href="{{ route('domain.index') }}" class="btn btn-secondary">Batal</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
