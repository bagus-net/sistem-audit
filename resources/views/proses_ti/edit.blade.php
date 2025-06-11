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
                        <label for="domain_id" class="form-label">ID Domain</label>
                        <select name="domain_id" id="domain_id" class="form-control" required>
                            <option value="">-- Pilih ID Domain --</option>
                            @foreach ($domains as $domain)
                                <option value="{{ $domain->id }}" {{ $prosesTi->domain_id == $domain->id ? 'selected' : '' }}>{{ $domain->id }} - {{ $domain->kode_domain }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="nama_domain" class="form-label">Nama Domain</label>
                        <input type="text" name="nama_domain" id="nama_domain" class="form-control" readonly value="{{ $prosesTi->domain->nama_domain ?? '' }}">
                    </div>
                    <div class="mb-3">
                        <label for="klausul_id" class="form-label">ID Klausul</label>
                        <select name="klausul_id" id="klausul_id" class="form-control" required>
                            <option value="">-- Pilih ID Klausul --</option>
                            @foreach ($klausuls as $klausul)
                                <option value="{{ $klausul->id }}" {{ $prosesTi->klausul_id == $klausul->id ? 'selected' : '' }}>{{ $klausul->kode_klausul }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="nama_klausul" class="form-label">Nama Klausul</label>
                        <input type="text" name="nama_klausul" id="nama_klausul" class="form-control" readonly value="{{ $prosesTi->klausul->nama_klausul ?? '' }}">
                    </div>
                     <div class="mb-3">
                        <label for="kode_proses" class="form-label">Kode Proses</label>
                        <input type="text" name="kode_proses" id="kode_proses" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="level" class="form-label">Level</label>
                        <select name="level" id="level" class="form-control" required>
                            <option value="">-- Pilih Level --</option>
                            @for ($i = 1; $i <= 5; $i++)
                                <option value="{{ $i }}" {{ $prosesTi->level == $i ? 'selected' : '' }}>{{ $i }}</option>
                            @endfor
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="nama_proses" class="form-label">Nama Proses</label>
                        <input type="text" name="nama_proses" id="nama_proses" class="form-control" required value="{{ $prosesTi->nama_proses }}">
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
@section('script')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const domainIdSelect = document.getElementById('domain_id');
        const namaDomainInput = document.getElementById('nama_domain');
        const klausulIdSelect = document.getElementById('klausul_id');
        const namaKlausulInput = document.getElementById('nama_klausul');
        const kodeProsesInput = document.getElementById('kode_proses');

        function fetchDomainName(domainId) {
            fetch('/proses_ti/get-domain/' + domainId)
                .then(response => response.json())
                .then(data => {
                    namaDomainInput.value = data.nama_domain;
                    generateKodeProses();
                });
        }
        function fetchKlausulName(klausulId) {
            fetch('/proses_ti/get-klausul/' + klausulId)
                .then(response => response.json())
                .then(data => {
                    namaKlausulInput.value = data.nama_klausul;
                    generateKodeProses();
                });
        }

        function generateKodeProses() {
            const selectedText = domainIdSelect.options[domainIdSelect.selectedIndex].text;
            const kodeDomain = selectedText.split(' - ')[1] || ''; // Get the domain code after the ID
            kodeProsesInput.value = kodeDomain;

            // Generate nama_proses format
            if (klausulIdSelect.selectedIndex > 0) {
                const kodeKlausul = klausulIdSelect.options[klausulIdSelect.selectedIndex].text;
                const namaKlausul = namaKlausulInput.value;
                document.getElementById('nama_proses').value = kodeDomain + '.' + kodeKlausul + ' (' + namaKlausul + ')';
            }
        }

        domainIdSelect.addEventListener('change', function() {
            const domainId = this.value;
            fetchDomainName(domainId);
        });

        klausulIdSelect.addEventListener('change', function() {
            const klausulId = this.value;
            fetchKlausulName(klausulId);
        });

        // Initialize kode_proses and nama_proses on page load
        generateKodeProses();
    });
</script>
@endsection
