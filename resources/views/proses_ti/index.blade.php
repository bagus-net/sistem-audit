@extends('layouts.master')
@section('title')
@lang('Daftar Pertanyaan')
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Data Pertanyaan</h2>
        </div>
        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        @if(session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif
        <div class="card">
            <div class="card-body">
                <a href="{{ route('proses_ti.create') }}" class="btn btn-success mb-3">Tambah Pertanyaan</a>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode Proses</th>
                                <th>Level</th>
                                <th>Praktik Manajemen</th>
                                <th>Pertanyaan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($prosesTis as $proses)
                            <tr>
                                <td>{{ $loop->index + 1 }}</td>
                                <td>{{ $proses->kode_proses ?? '-' }}</td>
                                <td>{{ $proses->level ?? '-' }}</td>
                                <td>{{ $proses->praktik_manajemen ?? '-' }}</td>
                                <td>{{ $proses->pertanyaan ?? '-' }}</td>
                                <td>
                                    <a href="{{ route('proses_ti.show', $proses->id) }}" class="btn btn-info btn-sm">Lihat</a>
                                    <a href="{{ route('proses_ti.edit', $proses->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                    <form action="{{ route('proses_ti.destroy', $proses->id) }}" method="POST" style="display:inline-block;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus pertanyaan ini?')">Hapus</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
