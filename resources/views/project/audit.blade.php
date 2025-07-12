@extends('layouts.master')
@section('title')
Audit Project
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    <form action="{{ route('project.saveAudit', $project->id) }}" method="POST">
                        @csrf
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Klausul</th>
                                    <th>Level</th>
                                    <th>Sub Proses</th>
                                    <th>Pertanyaan</th>
                                    <th>Jawaban (Y/N)</th>
                                    <th>Bukti Hasil Kerja</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($levels as $level)
                                    @foreach($level->questions as $question)
                                        <tr>
                                            <td>{{ $level->klausul->nama_klausul ?? '-' }}</td>
                                            <td>{{ $level->level }}</td>
                                            <td style="white-space: pre-line;">{{ $level->sub_proses }}</td>
                                            <td>{{ $question->pertanyaan }}</td>
                                            <td>
                                                <select name="answers[{{ $level->id }}_{{ $question->id }}][jawaban]" class="form-control" required>
                                                    <option value="">Pilih</option>
                                                    <option value="1">Y</option>
                                                    <option value="0">N</option>
                                                </select>
                                                <input type="hidden" name="answers[{{ $level->id }}_{{ $question->id }}][klausul_id]" value="{{ $level->klausul_id }}">
                                                <input type="hidden" name="answers[{{ $level->id }}_{{ $question->id }}][level_id]" value="{{ $level->id }}">
                                                <input type="hidden" name="answers[{{ $level->id }}_{{ $question->id }}][question_id]" value="{{ $question->id }}">
                                            </td>
                                            <td>
                                                <textarea name="answers[{{ $level->id }}_{{ $question->id }}][bukti_hasil_kerja]" class="form-control"></textarea>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            </tbody>
                        </table>
                        <button type="submit" class="btn btn-success">Simpan Audit</button>
                        <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
