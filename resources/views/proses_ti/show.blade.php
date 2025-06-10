@extends('layouts.master')
@section('title')
@lang('Detail Pertanyaan')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Detail Pertanyaan</h2>
        </div>
        <div class="card">
            <div class="card-body">
                <h5>Klausul: {{ $prosesTi->klausul->nama_klausul ?? '-' }}</h5>
                <h5>Kode Proses: {{ $prosesTi->kode_proses ?? '-' }}</h5>
                <h5>Level: {{ $prosesTi->level ?? '-' }}</h5>
                <h5>Praktik Manajemen: {{ $prosesTi->praktik_manajemen ?? '-' }}</h5>
                <p>Pertanyaan: {{ $prosesTi->pertanyaan ?? '-' }}</p>
                <a href="{{ route('proses_ti.index') }}" class="btn btn-secondary">Kembali</a>
                <a href="{{ route('proses_ti.edit', $prosesTi->id) }}" class="btn btn-warning">Edit</a>
            </div>
        </div>
    </div>
</div>
@endsection
