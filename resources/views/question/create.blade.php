@extends('layouts.master')
@section('title')
Tambah Pertanyaan
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Tambah Pertanyaan</div>
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
                    <form action="{{ route('question.store') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="level_id" class="form-label">Level</label>
                            <select name="level_id" id="level_id" class="form-control" required>
                                <option value="">Pilih Level</option>
                                @foreach($levels as $level)
                                    <option value="{{ $level->id }}">{{ $level->level }} ( {{ $level->klausul->nama_klausul ?? '-' }})</option>
                                @endforeach
                            </select>
                        </div>
                        <div id="pertanyaan-group">
                            <div class="mb-3 pertanyaan-item">
                                <label for="pertanyaan[]" class="form-label">Pertanyaan</label>
                                <textarea name="pertanyaan[]" class="form-control" required></textarea>
                            </div>
                        </div>
                        <button type="button" class="btn btn-info mb-2" id="add-pertanyaan">Tambah Pertanyaan</button>
                        <button type="submit" class="btn btn-success">Simpan</button>
                        <a href="{{ route('question.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
<script>
document.getElementById('add-pertanyaan').addEventListener('click', function() {
    var group = document.getElementById('pertanyaan-group');
    var item = document.createElement('div');
    item.className = 'mb-3 pertanyaan-item';
    item.innerHTML = `<label for="pertanyaan[]" class="form-label">Pertanyaan</label>
        <textarea name="pertanyaan[]" class="form-control" required></textarea>
        <button type="button" class="btn btn-danger btn-sm mt-2 remove-pertanyaan">Hapus</button>`;
    group.appendChild(item);
});
document.addEventListener('click', function(e) {
    if (e.target && e.target.classList.contains('remove-pertanyaan')) {
        e.target.parentElement.remove();
    }
});
</script>
@endsection
