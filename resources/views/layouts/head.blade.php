@yield('css')
<!-- Bootstrap Css -->
<link href="{{ URL::asset('/assets/css/bootstrap.min.css')}}" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="{{ URL::asset('/assets/css/icons.min.css')}}" id="icons-style" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="{{ URL::asset('/assets/css/app.min.css')}}" id="app-style" rel="stylesheet" type="text/css" />
<!-- Loading Css-->
<link href="{{ URL::asset('/assets/css/loading.css')}}" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="{{asset('assets/libs/codemirror/lib/codemirror.css')}}">
<link rel="stylesheet" href="{{asset('assets/libs/codemirror/theme/dracula.css')}}">