@extends('layouts.master')
@section('title')
Project
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<style>
    select.form-control option[disabled] {
        background: #ffeaea !important;
        color: #b30000 !important;
    }
</style>
@endsection

@push('scripts')
<script>
    // Inject user login ke window.authUser
    window.authUser = @json(auth()->user() ? auth()->user()->username : '');
</script>
<script src="{{ asset('js/project-create-klausul-level.js') }}"></script>
@endpush
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Buat Project</div>
                <div class="card-body">
                    <form action="{{ route('project.store') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="nama_project" class="form-label">Nama Project</label>
                            <input type="text" name="nama_project" id="nama_project" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="auditor" class="form-label">User</label>
                            <input type="text" name="auditor" id="auditor" class="form-control" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pilih Klausul</label>
                            <div class="row">
                                @foreach($klausuls as $klausul)
                                    @php
                                        $levels = $klausul->levels ?? (\App\Models\Level::where('klausul_id', $klausul->id)->get());
                                        $hasQuestions = false;
                                        foreach($levels as $level) {
                                            if($level->questions()->count() > 0) { $hasQuestions = true; break; }
                                        }
                                    @endphp
                                    <div class="col-12 mb-1">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="klausul_id[]" id="klausul_{{ $klausul->id }}" value="{{ $klausul->id }}" {{ (!$levels->count() || !$hasQuestions) ? 'disabled' : '' }}>
                                            <label class="form-check-label" for="klausul_{{ $klausul->id }}">
                                                {{ $klausul->nama_klausul }}
                                                @if($klausul->deskripsi)
                                                    <span class="text-muted">({{ $klausul->deskripsi }})</span>
                                                @endif
                                                @if(!$levels->count() || !$hasQuestions)
                                                    <span class="text-danger">(tidak bisa dipilih)</span>
                                                @endif
                                            </label>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Simpan</button>
                        <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
