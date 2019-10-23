{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('content')

    <div class="container">
    <h1>{{$topic->title}}</h1>
        <hr>
    <form action="{{ route('topics.update',$topic) }}" method="POST">
        @csrf
        @method('PATCH')  {{-- cette methode permet de mettre à jour la ressource --}}
        <div class="form-group">
            <label for="title">Titre du topic</label>
            {{-- @error   @enderror pour le systeme de validation --}}
        <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" id="title" value="{{$topic->title}}">

            @error('title')
            <div class="invalid-feedback">{{ $errors->first('title') }}</div>          
            @enderror

        </div>
        <div class="form-group">
            <label for="content">Votre sujet</label>
            {{-- @error   @enderror pour le systeme de validation --}}
        <textarea name="content" id="content" class="form-control @error('content') is-invalid @enderror" rows="5">{{$topic->content}}</textarea>
            @error('content')
            <div class="invalid-feedback">{{ $errors->first('content') }}</div>          
            @enderror
        </div>
        <button type="submit" class="btn btn-primary">Modifier mon topic</button>
    </form>
    </div>
   

@endsection