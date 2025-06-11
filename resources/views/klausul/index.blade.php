@extends('layouts.master')
@section('title')
@lang('Klausul')
@endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('/assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Data Klausul</h2>
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
                <a href="{{ route('klausul.create') }}" class="btn btn-success mb-3">Tambah Klausul</a>
                <div class="table-responsive">
                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode</th>
                                <th>Nama Klausul</th>
                                <th>Deskripsi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($klausuls as $klausul)
                            <tr>
                                <td>{{ $loop->index + 1 }}</td>
                                <td>{{ $klausul->kode_klausul ?? '-' }}</td>
                                <td>{{ $klausul->nama_klausul ?? '-' }}</td>
                                <td>{{ $klausul->deskripsi ?? '-' }}</td>
                                <td> 
                                    <a href="{{ route('klausul.show', $klausul->id) }}" class="btn btn-info btn-sm">Lihat</a>
                                    <a href="{{ route('klausul.edit', $klausul->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                    <form action="{{ route('klausul.destroy', $klausul->id) }}" method="POST" style="display:inline-block;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus klausul ini?')">Hapus</button>
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

@section('script')
<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/pages/datatables.init.js') }}"></script>
@endsection

<style>
    .dataTables_wrapper .dataTables_info + .dataTables_paginate {
        border-top: none;
    }
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="{{ asset('path/to/apexcharts/dist/apexcharts.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="{{ asset('js/dashboard-charts.js') }}"></script>

<link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('/assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('/assets/libs/chart-js/Chart.min.css') }}" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Libre+Barcode+128+Text&display=swap" rel="stylesheet">

<!-- DataTables Button CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h2 class="mb-0">Data Klausul</h2>
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
                <a href="{{ route('klausul.create') }}" class="btn btn-success mb-3">Tambah Klausul</a>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered dt-responsive nowrap" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Kode</th>
                                <th>Nama Klausul</th>
                                <th>Deskripsi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($klausuls as $klausul)
                            <tr>
                                <td>{{ $loop->index + 1 }}</td>
                                <td>{{ $klausul->kode_klausul ?? '-' }}</td>
                                <td>{{ $klausul->nama_klausul ?? '-' }}</td>
                                <td>{{ $klausul->deskripsi ?? '-' }}</td>
                                <td>
                                    <a href="{{ route('klausul.show', $klausul->id) }}" class="btn btn-info btn-sm">Lihat</a>
                                    <a href="{{ route('klausul.edit', $klausul->id) }}" class="btn btn-warning btn-sm">Edit</a>
                                    <form action="{{ route('klausul.destroy', $klausul->id) }}" method="POST" style="display:inline-block;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus klausul ini?')">Hapus</button>
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
@section('script')
<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/apexcharts/apexcharts.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/pages/apexcharts.init.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="{{ asset('js/dashboard-charts.js') }}"></script>

<!-- DataTables Buttons -->
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>

<script>
    $(document).ready(function() {
        $('.table-responsive table').DataTable({
            dom: 'Bfrtip', // Add buttons
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            pagingType: 'full_numbers',
            lengthMenu: [5, 10, 25, 50],
            pageLength: 10,
            responsive: true,
            language: {
                paginate: {
                    first: 'First',
                    last: 'Last',
                    next: 'Next',
                    previous: 'Previous'
                }
            }
        });
    });
</script>

@endsection
