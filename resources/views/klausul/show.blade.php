@extends('layouts.master')
@section('title')
@lang('Detail Klausul')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Detail Klausul</h2>
        </div>
        <div class="card">
            <div class="card-body">
                <h5>Domain: {{ $klausul->domain->nama_domain ?? '-' }}</h5>
                <h5>Kode Klausul: {{ $klausul->kode_klausul ?? '-' }}</h5>
                <h5>Nama Klausul: {{ $klausul->nama_klausul ?? '-' }}</h5>
                <p>Deskripsi: {{ $klausul->deskripsi ?? '-' }}</p>
                <a href="{{ route('klausul.index') }}" class="btn btn-secondary">Kembali</a>
                <a href="{{ route('klausul.edit', $klausul->id) }}" class="btn btn-warning">Edit</a>
            </div>
        </div>
    </div>
</div>
@endsection
