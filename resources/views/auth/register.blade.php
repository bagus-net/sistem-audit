@extends('layouts.master-without-nav')

@section('title')
    @lang('translation.Register')
@endsection

@section('content')
    {{-- <div class="home-btn d-none d-sm-block">
        <a href="{{ url('index') }}" class="text-dark"><i class="mdi mdi-home-variant h2"></i></a>
    </div> --}}

    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        {{-- <a href="{{ url('index') }}" class="mb-5 d-block auth-logo">
                            <img src="{{ URL::asset('/assets/images/logo-dark.png') }}" alt="" height="22" class="logo logo-dark">
                            <img src="{{ URL::asset('/assets/images/logo-light.png') }}" alt="" height="22" class="logo logo-light">
                        </a> --}}
                    </div>
                </div>
            </div>
            
            <div class="row align-items-center justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="text-center mt-2">
                                <h5 class="text-primary">Create an Account</h5>
                                <p class="text-muted">Sign up to get started.</p>
                            </div>
                            <div class="p-2 mt-4">
                                <!-- Register Form -->
                                <form method="POST" action="{{ route('register') }}">
                                    @csrf
                                    
                                    <!-- Username -->
                                    <div class="mb-3">
                                        <label class="form-label" for="username">Username</label>
                                        <input type="text" class="form-control @error('username') is-invalid @enderror" id="username" name="username" placeholder="Enter username" value="{{ old('username') }}" required>
                                        @error('username')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <!-- Email -->
                                    <div class="mb-3">
                                        <label class="form-label" for="email">Email</label>
                                        <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" placeholder="Enter email" value="{{ old('email') }}" required>
                                        @error('email')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <!-- Password -->
                                    <div class="mb-3">
                                        <label class="form-label" for="password">Password</label>
                                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" placeholder="Enter password" required>
                                        @error('password')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <!-- Confirm Password -->
                                    <div class="mb-3">
                                        <label class="form-label" for="password_confirmation">Confirm Password</label>
                                        <input type="password" class="form-control @error('password_confirmation') is-invalid @enderror" id="password_confirmation" name="password_confirmation" placeholder="Confirm password" required>
                                        @error('password_confirmation')
                                            <span class="invalid-feedback">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <!-- Role -->
                                    <div class="mb-3">
                                        <label class="form-label" for="role">Role</label>
                                        <select class="form-control" id="role" name="role" required>
                                            <option value="1">Admin</option>
                                            <option value="2">Auditor</option>
                                            <option value="3">Manager</option>
                                        </select>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="mt-3 text-end">
                                        <button class="btn btn-primary w-sm waves-effect waves-light" type="submit">Sign Up</button>
                                    </div>

                                    <div class="mt-4 text-center">
                                        <p class="mb-0">Already have an account? <a href="{{ route('login') }}" class="fw-medium text-primary"> Login now </a> </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    {{-- <div class="mt-5 text-center">
                        <p>© <script>document.write(new Date().getFullYear())</script> Minible. Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand</p>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
@endsection
