{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('extra-js')
    {!! NoCaptcha::renderJs() !!}
@endsection

@section('content')
    <h1>Contactez-nous</h1>
    {{-- cette directive blade @if permettra d'afficher le formulaire si aucun message n'a été envoyé --}}
    {{-- @if (!session()->('message') ) --}}
    <form action="{{url('contact')}}" method="POST">
        {{-- token csrf pour se prévenir contre la faille d'authification web--}}
        {{-- permet de vérifier que la personne qui fait les actions est authentifiée --}}

        @csrf

        {{-- @error('pseudo')is-invalid @enderror permet de mettre un visuel sur une erreur et avec le  class="invalid-feedback" nous permet de mettre un message personalisé--}}
        <div class="form-group" >

        <input type="text" class="form-control @error('name')is-invalid @enderror" name="name" placeholder="Votre nom..." value="{{old('name') }}">
            @error('name')
                <div class="invalid-feedback">
                    Ce champ est requis !
                </div>
            @enderror
        </div>
        <div class="form-group">
            <input type="email" class="form-control @error('email')is-invalid @enderror" name="email" placeholder="Votre email"value="{{old('email') }}">
            @error('email')
            <div class="invalid-feedback">
                    Ce champ est requis !
            </div>
            @enderror
        </div>
        <div class="form-group">
        <textarea name="message"  cols="30" rows="10" class="form-control @error('message')is-invalid @enderror" placeholder="Votre message">{{old('message')}}</textarea>
            @error('message')
            <div class="invalid-feedback">
                    Ce champ est requis !
            </div>
            @enderror
        </div>
        <div class="form-group">
            {!! NoCaptcha::display() !!}
            @if ($errors->has('g-recaptcha-response'))
                <span class="help-block">
                    <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                </span>
            @endif
        </div>
        <button type="submit" class="btn btn-primary">Envoyer le message</button>
    </form> 
    {{-- @endif --}}
@endsection