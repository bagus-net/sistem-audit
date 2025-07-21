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
                <li>
                    <a href="{{ url('/dashboard') }}">
                        <i class="uil uil-apps"></i>
                        <span>@lang('Dashboard')</span>
                    </a>
                </li>
                @php $role = auth()->user()->role ?? null; @endphp
                @if($role == '1' || $role == '2')
                    <li class="menu-title">@lang('Data')</li>
                    <li>
                        <a href="{{url('/klausul')}}">
                            <i class="uil-file-alt"></i>
                            <span>@lang('Data Klausul')</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{url('/level')}}">
                            <i class="uil-signal-alt-3"></i>
                            <span>@lang('Data Level')</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{url('/question')}}">
                            <i class="uil-question-circle"></i>
                            <span>@lang('Data Pertanyaan')</span>
                        </a>
                    </li>
                    <li class="menu-title">@lang('Process Audit')</li>
                @endif
                <li>
                    <a href="{{url('/project')}}">
                        <i class="uil-book-alt"></i>
                        <span>@lang('Project')</span>
                    </a>
                </li>
                @if($role == '1') {{-- Admin --}}
                    <li class="menu-title">@lang('Setting')</li>
                    <li>
                        <a href="{{url('users')}}">
                            <i class="uil-users-alt"></i>
                            <span>@lang('Users')</span>
                        </a>
                    </li>
                @endif
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
