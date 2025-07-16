@extends('layouts.master')
@section('title')
Audit Project - Level {{ $level->level }}
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    Audit Project: {{ $project->nama_project }}<br>
                    <span class="fw-bold">Klausul:</span> {{ $level->klausul->nama_klausul ?? '-' }}<br>
                    <span class="fw-bold">Level:</span> {{ $level->level }}
                </div>
                <div class="card-body">
                    <form action="{{ route('project.saveAuditLevel', [$project->id, $level->id]) }}" method="POST">
                        @csrf
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Pertanyaan</th>
                                    <th>Jawaban </th>
                                    <th>Bukti Hasil Kerja</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($level->questions as $question)
                                    <tr>
                                        <td>{{ $question->pertanyaan }}</td>
                                        <td class="text-center">
                                            <input type="hidden" name="answers[{{ $question->id }}][jawaban]" value="0">
                                            <input type="checkbox" name="answers[{{ $question->id }}][jawaban]" value="1" 
                                                {{ (isset($answers[$loop->index]) && $answers[$loop->index]->jawaban == 1) ? 'checked' : '' }}>
                                            <input type="hidden" name="answers[{{ $question->id }}][question_id]" value="{{ $question->id }}">
                                        </td>
                                        <td>
                                            <textarea name="answers[{{ $question->id }}][bukti_hasil_kerja]" class="form-control">{{ isset($answers[$loop->index]) ? $answers[$loop->index]->bukti_hasil_kerja : '' }}</textarea>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <button type="submit" class="btn btn-success">Simpan Audit Level {{ $level->level }}</button>
                        <a href="{{ route('project.levelList',$project->id) }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
