@extends('layouts.master')
@section('title')
Hasil Audit Project
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
@endsection
@section('content')

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Detail Project: {{ $project->nama_project }}</div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Klausul</th>
                                <th>Deskripsi</th>
                                <th>Level</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            @php 
                                $no = 1; 
                                $levelStandar = 85; // Standar skor minimal
                                $levelSum = 0;
                                $levelCount = 0;
                                $klausulLevelDisplay = [];
                            @endphp
                            @foreach($project->klausuls as $klausul)
                                @php
                                    // Ambil semua audit answer untuk klausul ini, urutkan level terbesar ke terkecil
                                    $answers = $project->auditAnswers->where('klausul_id', $klausul->id)->sortByDesc(function($a){ return $a->level->level; });
                                    $foundLevel = 1;
                                    foreach($answers as $ans) {
                                        $count = $project->auditAnswers->where('level_id', $ans->level_id)->count();
                                        $score = $count > 0 ? ($project->auditAnswers->where('level_id', $ans->level_id)->sum('jawaban') / $count) * 100 : 0;
                                        if($score > $levelStandar) {
                                            $foundLevel = $ans->level->level;
                                            break;
                                        }
                                    }
                                    $levelSum += $foundLevel;
                                    $levelCount++;
                                    $klausulLevelDisplay[$klausul->id] = $foundLevel;
                                @endphp
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td> {{ $klausul->nama_klausul }}</td>
                                    <td>{{ $klausul->deskripsi }}</td>
                                    <td>{{ $klausulLevelDisplay[$klausul->id] }}</td>
                                    <td>
                                        {{-- <a href="#" class="btn btn-primary btn-sm" title="View"><i class="fa fa-eye"></i></a>
                                        <a href="#" class="btn btn-warning btn-sm" title="Edit"><i class="fa fa-pencil-alt"></i></a>
                                        <a href="#" class="btn btn-danger btn-sm" title="Delete"><i class="fa fa-trash"></i></a> --}}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="row mt-4">
                        <div class="col-md-4">
                            <div class="border p-3 mb-3">
                                <div><b>Maturity level (rata-rata)</b></div>
                                <div>{{ number_format($levelCount > 0 ? $levelSum / $levelCount : 0, 2) }}</div>
                                <div class="mt-2"><b>(Pembulatan)</b></div>
                                @php
                                    $grandTotalRaw = $levelCount > 0 ? $levelSum / $levelCount : 0;
                                    if ($grandTotalRaw <= 0.50) {
                                        $nilaiMaturity = 0;
                                        $levelMaturity = 'Incomplete';
                                    } elseif ($grandTotalRaw <= 1.50) {
                                        $nilaiMaturity = 1;
                                        $levelMaturity = 'Initial';
                                    } elseif ($grandTotalRaw <= 2.50) {
                                        $nilaiMaturity = 2;
                                        $levelMaturity = 'Managed';
                                    } elseif ($grandTotalRaw <= 3.50) {
                                        $nilaiMaturity = 3;
                                        $levelMaturity = 'Defined';
                                    } elseif ($grandTotalRaw <= 4.50) {
                                        $nilaiMaturity = 4;
                                        $levelMaturity = 'Quantitative';
                                    } else {
                                        $nilaiMaturity = 5;
                                        $levelMaturity = 'Optimizing';
                                    }
                                @endphp
                                <div>{{ $nilaiMaturity }}</div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-6">
                                    @php
                                        $maturityProcessDesc = [
                                            1 => 'Proses layanan TI sudah dijalankan namun masih bersifat reaktif dan belum terstruktur.',
                                            2 => 'Proses layanan teknologi informasi mulai direncanakan, dilaksanakan, dan didokumentasikan secara sistematis, namun penerapan standar baku serta konsistensi perusahaann masih belum optimal.',
                                            3 => 'Proses layanan TI sudah memiliki pedoman tertulis dan dilaksanakan secara konsisten di seluruh perusahaan',
                                            4 => 'Proses layanan TI telah dipantau dan dievaluasi dengan ukuran kinerja yang jelas sehingga kinerjanya dapat diprediksi dan dikendalikan.',
                                            5 => 'Proses layanan TI terus ditingkatkan secara berkelanjutan melalui inovasi dan analisis hasil pengukuran kinerja.',
                                        ];
                                    @endphp
                                    <div class="alert alert-info">
                                        <b>Kesimpulan:</b><br>
                                        Anda berada di level {{ $nilaiMaturity ?? '-' }} (berdasarkan pembulatan), artinya proses anda:<br>
                                        <span class="text">{{ $maturityProcessDesc[$nilaiMaturity] ?? '-' }}</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    @php
                                        $maturityImprovement = [
                                            1 => 'Perusahaan perlu mulai menyusun aturan dan pedoman formal terkait layanan teknologi informasi agar pelaksanaan proses memiliki dasar yang jelas dan terarah.',
                                            2 => 'Perusahaan perlu meningkatkan konsistensi penerapan layanan dengan memperkuat dokumentasi serta menerapkan standar yang sama di seluruh unit.',
                                            3 => 'Evaluasi dan penyempurnaan aturan serta pedoman layanan perlu dilakukan secara berkala untuk memastikan kesesuaian dengan kebutuhan perusahaan dan perkembangan teknologi.',
                                            4 => 'Perusahaan perlu mengembangkan pengukuran kinerja dengan indikator yang lebih menyeluruh, serta menganalisis hasil evaluasi secara sistematis untuk mendukung proses pengambilan keputusan yang tepat.',
                                            5 => 'Budaya perbaikan berkelanjutan perlu diperkuat melalui inovasi, penerapan praktik terbaik, dan pemanfaatan teknologi baru agar efektivitas serta kepuasan pengguna layanan meningkat.',
                                        ];
                                    @endphp
                                    <div class="alert alert-success">
                                        <b>Saran Perbaikan</b><br>
                                        @if(($nilaiMaturity ?? 0) == 5)
                                            Tidak ada
                                        @else
                                            Untuk mencapai <b>Level {{ $nilaiMaturity + 1 ?? '-' }} ({{ $levelMaturity ?? '-' }})</b>,<br>
                                            <span class="text">{{ $maturityImprovement[$nilaiMaturity] ?? '-' }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3">
                                <div class="card">
                                    <div class="card-header">Target Level yang Akan Dicapai</div>
                                    <div class="card-body">
                                        @php
                                            $levelDesc = [
                                                1 => 'Level 1: Initial (Permulaan). Proses layanan TI dijalankan secara reaktif, tidak terstruktur, dan tanpa aturan atau pedoman resmi.',
                                                2 => 'Level 2: Managed (Terkelola). Proses layanan TI mulai direncanakan, dilaksanakan, dan didokumentasikan, namun konsistensi dan standarisasi belum optimal.',
                                                3 => 'Level 3: Defined (Ditetapkan). Standar di seluruh perusahaan memberikan panduan bagi perusahaan.',
                                                4 => 'Level 4: Quantitatively Managed (Terkelola secara Kuantitatif). Proses dipantau dan dievaluasi dengan ukuran kinerja yang jelas, sehingga kinerjanya dapat diprediksi dan dikendalikan.',
                                                5 => 'Level 5: Optimizing (Pengoptimalan). Proses layanan TI terus ditingkatkan secara berkelanjutan melalui inovasi dan analisis hasil pengukuran kinerja.',
                                            ];
                                            $targetLevel = ($nilaiMaturity ?? 0) < 5 ? ($nilaiMaturity + 1) : 5;
                                        @endphp
                                        <b>Level {{ $targetLevel }}</b>
                                        <div class="mt-2 p-3 border rounded bg-light">
                                            <b class="text-primary">Deskripsi Level {{ $targetLevel }}:</b><br>
                                            @if($targetLevel == 5 && ($nilaiMaturity ?? 0) == 5)
                                                <span style="color:#2196f3">Proses Layanan TI pada Perusahaan berjalan sempurna</span>
                                            @else
                                                <span style="color:#2196f3">{{ $levelDesc[$targetLevel] ?? '-' }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="{{ route('project.index') }}" class="btn btn-secondary mt-4">Kembali</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
