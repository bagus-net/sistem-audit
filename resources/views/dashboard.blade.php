<!-- start page title -->
@extends('layouts.master')
@section('title')
@lang('Dashboard')
@endsection
@section('css')

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="{{ asset('path/to/apexcharts/dist/apexcharts.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="{{ asset('js/dashboard-charts.js') }}"></script>

<!-- FullCalendar CSS -->
<link href="{{ URL::asset('/assets/libs/fullcalendar/fullcalendar.min.css') }}" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/main.min.css" rel="stylesheet" />

<link href="{{ URL::asset('/assets/libs/datatables/datatables.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('/assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('/assets/libs/chart-js/Chart.min.css') }}" rel="stylesheet" type="text/css" />


@endsection


@section('content')
@php
    $totalProject = \App\Models\Project::count();
    $totalQuestion = \App\Models\Question::count();
    $totalKlausul = \App\Models\Klausul::count();
@endphp
<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold text-dark">Dashboard</h2>
        <hr>
    </div>
</div>
<div class="row mt-4">
    <div class="col-md-4">
        <div class="card shadow border-0 text-center" style="background: linear-gradient(135deg, #e0ffe7 0%, #f0fdfa 100%);">
            <div class="card-body">
                <div class="mb-2">
                    <i class="fa fa-book fa-3x text-success"></i>
                </div>
                <h3 class="fw-bold mb-0" style="font-size:2.5rem;">{{ $totalKlausul }}</h3>
                <div class="text-muted">Total Klausul</div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card shadow border-0 text-center" style="background: linear-gradient(135deg, #fef6e4 0%, #f0fdfa 100%);">
            <div class="card-body">
                <div class="mb-2">
                    <i class="fa fa-question-circle fa-3x text-warning"></i>
                </div>
                <h3 class="fw-bold mb-0" style="font-size:2.5rem;">{{ $totalQuestion }}</h3>
                <div class="text-muted">Total Pertanyaan</div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card shadow border-0 text-center" style="background: linear-gradient(135deg, #e0e7ff 0%, #f0fdfa 100%);">
            <div class="card-body">
                <div class="mb-2">
                    <i class="fa fa-list-alt fa-3x text-primary"></i>
                </div>
                <h3 class="fw-bold mb-0" style="font-size:2.5rem;">{{ $totalProject }}</h3>
                <div class="text-muted">Total Project</div>
            </div>
        </div>
    </div>
</div>

{{-- <div class="row">
        <div class="col-12">

            <div class="row">
                <div class="col-12">

                    <div class="row">
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="card-body d-grid">
                                    <button class="btn font-16 btn-primary btn-block" id="btn-new-event"><i
                                            class="mdi mdi-plus-circle-outline"></i> Create New Event</button>
                                    <div class="row justify-content-center mt-5">
                                        <img src="{{ URL::asset('/assets/images/coming-soon-img.png') }}" alt=""
                                            class="img-fluid d-block">
                                    </div>
                                    <div id="external-events" class="m-t-20">
                                        <br>
                                        <p class="text-muted">Drag and drop your event or click in the calendar</p>
                                        <div class="external-event fc-event bg-success" data-class="bg-success">
                                            <i class="mdi mdi-checkbox-blank-circle font-size-11 me-2"></i>New Event
                                            Planning
                                        </div>
                                        <div class="external-event fc-event bg-info" data-class="bg-info">
                                            <i class="mdi mdi-checkbox-blank-circle font-size-11 me-2"></i>Meeting
                                        </div>
                                        <div class="external-event fc-event bg-warning" data-class="bg-warning">
                                            <i class="mdi mdi-checkbox-blank-circle font-size-11 me-2"></i>Generating
                                            Reports
                                        </div>
                                        <div class="external-event fc-event bg-danger" data-class="bg-danger">
                                            <i class="mdi mdi-checkbox-blank-circle font-size-11 me-2"></i>Create New theme
                                        </div>
                                    </div>

                                    <ol class="activity-feed mb-0 ps-2 mt-4 ms-1">
                                        <li class="feed-item">
                                            <p class="mt-0 mb-0">Andrei Coman magna sed porta finibus, risus
                                                posted a new article: Forget UX Rowland</p>
                                        </li>
                                        <li class="feed-item">
                                            <p class="mt-0 mb-0">Zack Wetass, sed porta finibus, risus Chris Wallace
                                                Commented Developer Moreno</p>
                                        </li>
                                        <li class="feed-item">
                                            <p class="mt-0 mb-0">Zack Wetass, Chris combined Commented UX Murphy</p>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div> <!-- end col-->

                        <div class="col-lg-9">
                            <div class="card">
                                <div class="card-body">
                                    <div id="calendar"></div>
                                </div>
                            </div>
                        </div> <!-- end col -->

                    </div>

                    <div style='clear:both'></div>

                    <!-- Add New Event MODAL -->
                    <div class="modal fade" id="event-modal" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header py-3 px-4 border-bottom-0">
                                    <h5 class="modal-title" id="modal-title">Event</h5>

                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-hidden="true"></button>

                                </div>
                                <div class="modal-body p-4">
                                    <form class="needs-validation" name="event-form" id="form-event" novalidate>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Event Name</label>
                                                    <input class="form-control" placeholder="Insert Event Name" type="text"
                                                        name="title" id="event-title" required value="" />
                                                    <div class="invalid-feedback">Please provide a valid event name</div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Category</label>
                                                    <select class="form-control form-select" name="category"
                                                        id="event-category" required>
                                                        <option value="bg-danger" selected>Danger</option>
                                                        <option value="bg-success">Success</option>
                                                        <option value="bg-primary">Primary</option>
                                                        <option value="bg-info">Info</option>
                                                        <option value="bg-dark">Dark</option>
                                                        <option value="bg-warning">Warning</option>
                                                    </select>
                                                    <div class="invalid-feedback">Please select a valid event category</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-danger"
                                                    id="btn-delete-event">Delete</button>
                                            </div>
                                            <div class="col-6 text-end">
                                                <button type="button" class="btn btn-light me-1"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-success"
                                                    id="btn-save-event">Save</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div> <!-- end modal-content-->
                        </div> <!-- end modal dialog--> --}}
                    </div> </div> </div>
@endsection
@section('script')
<script src="{{ URL::asset('/assets/libs/datatables/datatables.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/jszip/jszip.min.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/pdfmake/pdfmake.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/pages/datatables.init.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/apexcharts/apexcharts.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/pages/apexcharts.init.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="{{ asset('js/dashboard-charts.js') }}"></script>
<script src="{{ URL::asset('/assets/libs/moment/moment.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/jquery-ui-dist/jquery-ui-dist.min.js') }}"></script>
    <script src="{{ URL::asset('/assets/libs/fullcalendar/fullcalendar.min.js') }}"></script>

    <!-- Calendar init -->
    <script src="{{ URL::asset('/assets/js/pages/calendar.init.js') }}"></script>
<!-- FullCalendar JS -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/main.min.js"></script>
<script src="{{ asset('js/dashboard-calendar.js') }}"></script>
@endsection