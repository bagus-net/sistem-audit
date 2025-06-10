@extends('layouts.master')
@section('title')
@lang('Edit Pertanyaan')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Edit Pertanyaan</h2>
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
                <form action="{{ route('proses_ti.update', $prosesTi->id) }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="klausul_id" class="form-label">Klausul</label>
                        <select name="klausul_id" id="klausul_id" class="form-control" required>
                            <option value="">-- Pilih Klausul --</option>
                            @foreach ($klausuls as $klausul)
                                <option value="{{ $klausul->id }}" {{ $prosesTi->klausul_id == $klausul->id ? 'selected' : '' }}>{{ $klausul->nama_klausul }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="kode_proses" class="form-label">Kode Proses</label>
                        <input type="text" name="kode_proses" id="kode_proses" class="form-control" maxlength="10" value="{{ $prosesTi->kode_proses }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="level" class="form-label">Level</label>
                        <input type="number" name="level" id="level" class="form-control" value="{{ $prosesTi->level }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="praktik_manajemen" class="form-label">Praktik Manajemen</label>
                        <input type="text" name="praktik_manajemen" id="praktik_manajemen" class="form-control" maxlength="255" value="{{ $prosesTi->praktik_manajemen }}" required>
                    </div>
                    <div class="mb-3">
                        <label for="pertanyaan" class="form-label">Pertanyaan</label>
                        <textarea name="pertanyaan" id="pertanyaan" class="form-control" required>{{ $prosesTi->pertanyaan }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Perbarui</button>
                    <a href="{{ route('proses_ti.index') }}" class="btn btn-secondary">Batal</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
