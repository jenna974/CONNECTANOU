{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('content')

<h1>Editer le profil de {{ $client->name }}</h1><br><hr><br>
      {{-- RETOURNE UN JSON avec ->name on décide de récupérer que les noms--}}
</ul>

<form action="/ConnectanouLaravel/public/clients/{{$client->id}}" method="POST" enctype="multipart/form-data">
    {{-- enctype="multipart/form-data" --}}
    @method('PATCH')
    @include('includes.form')
    <button type="submit" class="btn btn-primary">Sauvegarder les informationst</button>
</form>
@endsection