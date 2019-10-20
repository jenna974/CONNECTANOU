{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')
@section('content')

<h1>Créer un nouveau client</h1><br><hr><br>
      {{-- RETOURNE UN JSON avec ->name on décide de récupérer que les noms--}}
</ul>

<form action="/ConnectanouLaravel/public/clients" method="POST" enctype="multipart/form-data">
    {{-- enctype="multipart/form-data" --}}
    @include('includes.form')
    <button type="submit" class="btn btn-primary">Ajouter un client</button>
</form>
@endsection