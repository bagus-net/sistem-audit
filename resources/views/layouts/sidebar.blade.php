<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="{{url('dashboard')}}" class="logo logo-dark">
            {{-- <span class="logo-sm">
                <img src="{{ URL::asset('/assets/images/mgm.png') }}" alt="" height="30">
            </span>
            <span class="logo-lg">
                <img src="{{ URL::asset('/assets/images/mgm-light.png') }}" alt="" height="40">
            </span> --}}
        </a>

        <a href="{{url('dashboard')}}" class="logo logo-light">
            {{-- <span class="logo-sm">
                <img src="{{ URL::asset('/assets/images/mgm.png') }}" alt="" height="30">
            </span>
            <span class="logo-lg">
                <img src="{{ URL::asset('/assets/images/mgm-dard.png') }}" alt="" height="40">
            </span> --}}
        </a>
    </div>

    <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
        <i class="fa fa-fw fa-bars"></i>
    </button>

    <div data-simplebar class="sidebar-menu-scroll">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">@lang('Data')</li>

                <!-- Dashboard Menu -->
                <li>
                    <a href="{{url('/domain')}}">
                        <i class="uil-chart-bar"></i>
                        <span>@lang('Data Domain')</span>
                    </a>
                </li>
                <li>
                    <a href="{{url('/klausul')}}">
                        <i class="uil-file-alt"></i>
                        <span>@lang('Data Klausul')</span>
                    </a>
                </li>
                <li>
                    <a href="{{url('/proses_ti')}}">
                        <i class="uil-question-circle"></i>
                        <span>@lang('Pertanyaan')</span>
                    </a>
                </li>

                {{-- <!-- Produksi Menu -->
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="uil-dice-four"></i>
                        <span>Produksi</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="true">
                        <li>
                            <a href="{{url('/bahanbakumasuk')}}">
                                <i class="uil-file-blank"></i>
                                <span>@lang('Incoming')</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{url('/pemakaian')}}">
                                <i class="uil-file-alt"></i>
                                <span>@lang('Pemakaian Produksi')</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{url('/barangjadi')}}">
                                <i class="uil-file-check"></i>
                                <span>@lang('Barang Jadi Masuk')</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{url('/barangjadikeluar')}}">
                                <i class="uil-file-times-alt"></i>
                                <span>@lang('Barang Jadi Keluar')</span>
                            </a>
                        </li>
                    </ul>
                </li> --}}

                <!-- Laporan Menu -->
                <li>
                    <a href="{{url('/laporan')}}">
                        <i class="uil-book-alt"></i>
                        <span>@lang('Laporan')</span>
                    </a>
                </li>

                <li>
                    <a href="{{url('users')}}">
                        <i class="uil-users-alt"></i>
                        <span>@lang('Users')</span>
                    </a>
                </li>
                {{-- @if (Auth::check())
                    <li>
                        <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <button type="submit" class="btn btn-link">Logout</button>
                        </form>
                    </li>
                @else
                    <li><a href="{{ route('login') }}">Login</a></li>
                    <li><a href="{{ route('register') }}">Register</a></li>
                @endif --}}
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
