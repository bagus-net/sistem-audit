@extends('layouts.master')
@section('title')
Pilih Level Audit
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
@endsection
@section('content')
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
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
                {{-- ALERTS DIHILANGKAN SESUAI PERMINTAAN --}}
                <div class="card-header">Pilih Level untuk Audit Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    {{-- <div class="alert alert-info" style="font-size: 15px;">
                        <b>Catatan:</b> Hanya level 2 pada klausul pertama yang terbuka. Untuk memulai audit, tekan tombol <b>Audit</b> pada kolom Aksi.
                    </div> --}}
                    @php
    // Pagination setup
    $perPage = 10;
    $page = request()->get('page', 1);
    $levelsArray = $levels->toArray();
    $totalLevels = count($levelsArray);
    $offset = ($page - 1) * $perPage;
    $paginatedLevels = array_slice($levelsArray, $offset, $perPage);
    // Hitung skor per level
    $levelScores = [];
    $lockedKlausulLevel = session('locked_klausul_level', []);
    foreach($levels as $level) {
        $answers = \App\Models\AuditAnswer::where('project_id', $project->id)->where('level_id', $level->id)->get();
        $count = $answers->count();
        $score = $count > 0 ? ($answers->sum('jawaban') / $count) * 100 : 0;
        $levelScores[$level->id] = $score;
    }
@endphp
                    <form action="{{ route('project.show', $project->id) }}" method="GET">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">No</th>
                                    <th>Klausul</th>
                                    <th>Sub Proses</th>
                                    <th class="text-center">Level</th>
                                    <th class="text-center">Skor & Skala (%)</th>
                                    <th class="text-center" style="width: 220px;">Deskripsi</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($paginatedLevels as $i => $level)
                                @php
                                    // $level di sini adalah array, ambil model Level
                                    $levelModel = \App\Models\Level::find($level['id']);
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $offset + $i + 1 }}</td>
                                    <td>{{ $levelModel->klausul->nama_klausul ?? '-' }}</td>
                                    <td style="white-space: pre-line;">{{ $levelModel->sub_proses }}</td>
                                    <td class="text-center">{{ $levelModel->level }}</td>
                                    <td class="text-center">
                                        {{ number_format($levelScores[$levelModel->id], 2) }}
                                        @php
                                            $score = $levelScores[$levelModel->id];
                                            if ($score <= 15) {
                                                $skala = 'N';
                                                $desc = '<b>Not Achieved</b><br><span style="font-size:13px">Tidak Tercapai.<br>Tidak ada aktivitas yang dilakukan dalam mencapai tujuan bisnis.</span>';
                                            } elseif ($score <= 50) {
                                                $skala = 'P';
                                                $desc = '<b>Partially Achieved</b><br><span style="font-size:13px">Sebagian Kecil Tercapai.<br>Ada bukti pendekatan dan proses, beberapa atribut pencapaian kinerja mungkin tidak dapat diprediksi.</span>';
                                            } elseif ($score <= 85) {
                                                $skala = 'L';
                                                $desc = '<b>Largely Achieved</b><br><span style="font-size:13px">Sebagian Besar Tercapai.<br>Proses TI sudah diimplementasikan, beberapa hal perlu diperbaiki.</span>';
                                            } else {
                                                $skala = 'F';
                                                $desc = '<b>Fully Achieved</b><br><span style="font-size:13px">Seluruhnya Tercapai.<br>Proses telah diimplementasikan dan dikelola dengan baik, siap dinilai ke level selanjutnya.</span>';
                                            }
                                        @endphp
                                        <span class="badge bg-primary">{{ $skala }}</span>
                                    </td>
                                    <td class="text-center" style="max-width:220px; word-break:break-word;">
                                        {!! $desc !!}
                                    </td>
                                    <td>
                                        @php
                                            $isLocked = false;
                                            $lockInfo = isset($lockedKlausulLevel[$levelModel->klausul_id]) ? $lockedKlausulLevel[$levelModel->klausul_id] : null;
                                            if (!in_array($levelModel->id, $auditedLevelIds)) {
                                                if (is_array($lockInfo) && in_array($levelModel->level, $lockInfo)) {
                                                    $isLocked = true;
                                                } elseif (is_int($lockInfo) && $levelModel->level > $lockInfo) {
                                                    $isLocked = true;
                                                }
                                            }
                                        @endphp
                                        @if($isLocked)
                                            <button class="btn btn-secondary btn-sm" title="Level terkunci" disabled>
                                                <i class="fa fa-lock"></i> Terkunci
                                            </button>
                                        @else
                                            @if(in_array($levelModel->id, $auditedLevelIds))
                                                <a href="{{ route('project.auditLevel', [$project->id, $levelModel->id]) }}" class="btn btn-warning btn-sm" title="Edit Audit">
                                                    <i class="fa fa-pencil-alt"></i>
                                                </a>
                                            @else
                                                <a href="{{ route('project.auditLevel', [$project->id, $levelModel->id]) }}" class="btn btn-primary btn-sm" title="Audit Level Ini">
                                                    <i class="fa fa-clipboard-check"></i>
                                                </a>
                                            @endif
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{-- Pagination controls --}}
                        <nav aria-label="Level pagination">
                            <ul class="pagination justify-content-center">
                                @for($p = 1; $p <= ceil($totalLevels / $perPage); $p++)
                                    <li class="page-item {{ $p == $page ? 'active' : '' }}">
                                        <a class="page-link" href="?page={{ $p }}">{{ $p }}</a>
                                    </li>
                                @endfor
                            </ul>
                        </nav>
                        <div class="text-end">
                            <button type="submit" class="btn btn-success">Simpan</button>
                        </div>
                    </form>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
