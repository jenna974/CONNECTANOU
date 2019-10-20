{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="list-group">
            @foreach ($topics as $topic )                
                    <div class="list-group-item">
                        <h4><a href="{{ route('topics.show',$topic)}}">{{ $topic->title }}</a></h4>
                    <p>{{$topic->content}}</p>
                    <div class='d-flex justify-content-between'>
                    <small>Posté le : {{ $topic->created_at->format('d/m/Y ')}}</small>
                    <span class="badge badge-primary">{{ $topic->user->name}}</span>
                    </div>                   
                </div>
            @endforeach
        </div>
    </div>
    {{-- nous permet d'utiliser le menu de navigation des pages --}}
    <div class="d-flex justify-content-center mt-3">
        {{ $topics->links()}}
    </div>
    
@endsection