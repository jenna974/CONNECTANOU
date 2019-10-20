@extends('layouts.app')

@section('content')
<div class="container">
<div class="row justify-content-center">

        <div class="col-md-8">
        <div align="center"><h1> Inscription du porteur </h1></div>
            <div class="card">
                <div class="card-header">{{ __("Mon profil :") }}</div>
                <!-- <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('Votre nom:') }}</label>  -->
                <div class="card-body">
                    <form method="POST" action="{{ url('registerPorteur') }}">
                        @csrf method('HEAD')
                       <div>
                        <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Nom: *') }}</label> 
                                <input id="nom" type="text" class="form-control @error('nom') is-invalid @enderror" name="nom" value="{{ old('nom') }}" required autocomplete="nom" autofocus>
                                @error('nom')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            
                            <div class="col-md-6">
                               <label class=" col-form-label text-md-right">{{ __('Prénom: *') }}</label> 
                                <input id="prenom" type="text" class="form-control @error('prenom') is-invalid @enderror" name="prenom" value="{{ old('prenom') }}" required autocomplete="prenom" autofocus>
                                @error('prenom')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                         <div class="form-group row">
                         <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Téléphone: *') }}</label> 
                                <input id="telperso" type="telperso" class="form-control @error('telperso') is-invalid @enderror" name="telperso" value="{{ old('telperso') }}" required autocomplete="telperso" autofocus>
                                @error('telperso')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                             <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __( 'Login: ') }}</label> 
                                <input id="login" type="text" class="form-control @error('login') is-invalid @enderror" name="login" value="{{ old('login') }}"autofocus>
                            </div>
                        </div>   

                        <div class="form-group row">
                            <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Adresse email: *') }}</label> 
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                             </div>
                                                                                                                                       
                        <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Votre mot de passe: *') }}</label> 
                                <input  id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                                <div class="col-md-6">
                                <label class=" col-form-label text-md-right">{{ __('Confirmer le mot de passe: *') }}</label> 
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="card-header">{{ __("Mon organisation :") }}</div>
                        <div class="form-group row">
                        <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __("Nom de l'organisation: *") }}</label> 
                                <input id="orga" type="text" class="form-control @error('orga') is-invalid @enderror" name="orga" value="{{ old('orga') }}" required autocomplete="orga" autofocus>
                                @error('orga')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __("Type d'organisation: *") }}</label> 
                            <form  size ="37" method="post" >
                               <select  class="form-control @error('type_orga') is-invalid @enderror" value="{{ old('type_orga') }}" autocomplete="type_orga" autofocus name="type_orga" required >
                                <option value="">Choississez votre type d'organisation</option>
                              @foreach ($classname_type_orga as $data)
                             <option value="{{ $data->id_type_org }}" > {{ $data->label_org}}</option>
                              @endforeach
                              </select>
                            </form>
                                @error('type_orga')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            </div>
                        
                       <div class="form-group row">
                       <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Poste occupé: *') }}</label> 
                                <input id="poste" type="text" class="form-control @error('poste') is-invalid @enderror" name="poste" value="{{ old('poste') }}" required autocomplete="poste" autofocus>
                                @error('poste')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Raison sociale: *') }}</label> 
                                <input id="raison" type="text" class="form-control @error('raison') is-invalid @enderror" name="raison" value="{{ old('raison') }}" required autocomplete="raison" autofocus>
                                @error('raison')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div> 
                            </div> 

                            <div class="form-group row">
                       <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('SIRET: *') }}</label> 
                                <input id="siret" type="text" class="form-control @error('siret') is-invalid @enderror" name="siret" value="{{ old('siret') }}" required autocomplete="siret" autofocus>
                                @error('siret')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div> 
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Sigle: ') }}</label> 
                                <input id="sigle" type="text" class="form-control @error('sigle') is-invalid @enderror" name="sigle" value="{{ old('sigle') }}">
                                @error('sigle')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div> 
                            </div>
                             

                            <div class="form-group row">
                       <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('URL_Logo: ') }}</label> 
                                <input id="logo" type="text" class="form-control @error('logo') is-invalid @enderror" name="logo" value="{{ old('logo') }}">
                                @error('logo')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div> 
                            </div> 

                        <div class="form-group row">
                        <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Téléphone: *') }}</label> 
                                <input id="tel_orga" type="tel_orga" class="form-control @error('tel_orga') is-invalid @enderror" pattern="[0-9]{10}" name="tel_orga" value="{{ old('tel_orga') }}" required autocomplete="tel_orga" autofocus>
                                @error('tel_orga')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                           <div class="col-md-6">
                                <label class=" col-form-label text-md-right">{{ __('Mon activité: *') }}</label> 
                                    <textarea name="activite" id="activite" class="form-control @error('activite') is-invalid @enderror" rows="5"></textarea>
                           @error('activite')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        </div> 
                  
                    
                         
                        <div class="form-group row">
                         <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Site web: ') }}</label> 
                                <input id="site" type="site" class="form-control @error('site') is-invalid @enderror" name="site" value="{{ old('site') }}">
                                @error('site')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                        </div> 

                        <div class="form-group row">
                         <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Adresse: *') }}</label> 
                                <input id="adresse" type="adresse" class="form-control @error('adresse') is-invalid @enderror" name="adresse" value="{{ old('adresse') }}" required autocomplete="adresse" autofocus>
                                @error('adresse')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                        </div> 
                            
                        <div class="form-group row">
                             <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Ville: *') }}</label> 
                            <form  size ="37" method="post" >
                               <select  class="form-control @error('ville') is-invalid @enderror" value="{{ old('ville') }}" required autocomplete="ville" autofocus name="ville" required >
                                <option value="">Choississez votre ville</option>
                              @foreach ($classname_ville as $data)
                             <option value="{{ $data->id_cp }}" > {{ $data->ville}}</option>
                              @endforeach
                              </select>
                            </form>
                                @error('ville')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                         <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Code postal: *') }}</label> 
                            <form  size ="37" method="post" >
                               <select  class="form-control @error('postal') is-invalid @enderror" value="{{ old('postal') }}" required autocomplete="postal" autofocus name="postal" required >
                                <option value="">Votre code postal</option>
                              @foreach ($classname_ville as $data)
                             <option value="{{ $data->id_cp }}" > {{ $data->cp}}</option>
                              @endforeach
                              </select>
                            </form>
                                @error('postal')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                        </div> 

                        <div class="form-group row">
                         <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Effectif: *') }}</label> 
                                <input id="effectif" type="effectif" class="form-control @error('effectif') is-invalid @enderror" name="effectif" value="{{ old('effectif') }}" required autocomplete="effectif" autofocus>
                                @error('effectif')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div> 
                        </div> 
                    
                       
                        <div align="center" class="form-group">
                       <div class="col-md-12">
                        Tous les champs avec un * sont obligatoires !!
                        <div>
                       <label><input type="checkbox" name="condition" id="condition" required> En cochant cette case, j'accepte que mes informations saisies soient utilisées uniquement dans le cadre légale dans l'association.</label >
                       <!-- J'accepte <a href="mentionLegal">les thermes &amp; et les conditions</a> pour l'inscription.</label > -->
                       </div>
       
                                <button type="submit" class="btn btn-primary" name="registerPorteur">
                                    {{ __("S'inscrire") }}
                                </button>
                                <p>Vous avez un compte ? <a href="login">Connectez-vous ici !!</a></p>
                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection