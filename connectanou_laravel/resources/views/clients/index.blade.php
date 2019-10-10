{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('content')
<h1>Clients</h1>
<a href="clients/create" class="btn btn-primary my-3">Nouveau client</a>
<ul>
    {{-- on exploite les données dans la view avec un foreach qui récupere les données du tableau --}}
    {{-- ci-dessous cela correspond à la même syntaxe que le foreach juste au dessus --}}

   
        {{-- <li>{{ $client->name }}, <em class="text-muted">{{ $client->email }}, ({{ $client->entreprise->name}})</em> </li> --}}
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nom</th>
                <th scope="col">Status</th>
                <th scope="col">Entreprise</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($clients as $client )
                <tr>
                <th scope="row">{{$client->id}}</th>
                <td> <a href="/ConnectanouLaravel/public/clients/{{ $client->id}}" > {{$client->name}}</a> </td>
                    <td>{{$client->status }}</td>
                    <td>{{$client->entreprise->name}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    

  
@endsection
