<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    {{-- extra js --}}
    @yield('extra-js') 
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body class="h-100">
    <div id="app" >
        <nav class="navbar navbar-expand-md navbar-light bg-light shadow-sm" >
            <div class="container">
                    <a class="navbar-brand ml-auto" href="/ConnectanouLaravel/public/"><img src="{{ asset('img/logoconnect.png')}}" width="120px;" class="pr-2" alt="" >
                        
                    
                    
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    {{-- <img src="{{ asset('img/logoconnect.png')}}" width="150px height=150px" class="pr-2" alt="" > --}}
                    
                    <ul class="navbar-nav mr-auto">
                        
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/"><strong>Accueil</strong></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/realisateur"><strong>Réalisateur</strong></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/porteur"><strong>Porteur de projet</strong></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/a-propos"><strong>L'association</strong></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/topics"><strong>Forum</strong></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/contact"><strong>Contact</strong></a>
                    </li>
                    {{-- <li class="nav-item">
                        <a class="nav-link active" href="/ConnectanouLaravel/public/clients"><strong>Voir les clients</strong></a>
                    </li> --}}
                    
                    
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link active" href="{{ route('login') }}"><strong>{{ __('Se connecter') }}</strong></a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item dropdown">

                             <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre 
                             class="nav-link active" ><strong>{{ __('S\'enregistrer') }}</strong></a>
                                    
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a href="{{ route('register') }}" class="dropdown-item">Réalisateur</a>
                                <a href="{{ url('registerPorteur') }}" class="dropdown-item">Porteur</a>
                                   

                                </li>
                                </div>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a href="{{route('topics.create')}}" class="dropdown-item">Créer un sujet</a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Profile') }}
                                    </a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Se déconnecter') }}
                                    </a>


                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>
        
        <main class="py-4 container">
              {{-- le contenu des autres pages en dessous de la nav bar 
                à chaque fois que une page hérite de ce layout, le contenu de la page ira dans 'content'
                --}}
            @if (session()->has('message'))
                <div class="alert alert-success" role="alert">
                    {{session()->get('message')}}
                </div>                
            @endif
            @yield('content')
        </main>

        {{-- footer --}}
        <footer class=" bg-primary  position-relative pb-5">
            <p class="">ceci est le footer du site</p>
        
        </footer>

    </div>
</body>
</html>
