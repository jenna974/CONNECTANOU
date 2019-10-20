@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
        <div align="center"><h1> Inscription du réalisateur </h1></div>
            <div class="card">
                <div class="card-header">{{ __("Mon profil :") }}</div>
                
                <!-- <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('Votre nom:') }}</label>  -->
                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}" id="auth\register">
                        @csrf
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
                            <label class=" col-form-label text-md-right">{{ __( 'Login: ') }}</label> 
                                <input id="login" type="text" class="form-control @error('login') is-invalid @enderror" name="login" value="{{ old('login') }}"autofocus>
                            </div>
                            
                           <div class="col-md-6">
                           <label class=" col-form-label text-md-right">{{ __('Statut: *') }}</label> 
                                <form  size ="37" method="post" >
                               <select  class="form-control @error('statut') is-invalid @enderror" value="{{ old('statut') }}" required autocomplete="statut" autofocus name="statut" required >
                                <option value="">Choississez votre statut</option>
                              @foreach ($classname_statut as $data)
                             <option value="{{ $data->id_statut_real }}" > {{ $data->label_statut_real}}</option>
                              @endforeach
                              </select>
                            </form>
                                @error('statut')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Autre statut: *') }}</label> 
                                <input  id="diplome" type="text" class="form-control" name="diplome"  autofocus>
                            </div>
                        </div> 
                            </div>
                        </div>  

                        <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Téléphone: *') }}</label> 
                                <input id="tel" type="tel" class="form-control @error('tel') is-invalid @enderror" name="tel" value="{{ old('tel') }}" required autocomplete="tel" autofocus>
                                @error('tel')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             </div>
                             <div class="col-md-6">
                             <label class=" col-form-label text-md-right">{{ __('Date de naissance: ') }}</label>
                                <input id="datenais" type="date" class="form-control @error('datenais') is-invalid @enderror" name="datenais" autofocus>
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
                            <label class=" col-form-label text-md-right">{{ __('Mot de passe: *') }}</label> 
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

                        <div class="card-header">{{ __("Mon école (Seulement si vous êtes étudiant(e)) : ") }}</div><br/>
                         <div class="form-group row">
                            <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Ecole: ') }}</label> 
                                <form  size ="37" method="post" >
                               <select  class="form-control @error('ecole') is-invalid @enderror" id="ecole" name="ecole" value="{{ old('ecole') }}" autofocus>
                               <option value="">Choississez votre école</option>
                               @foreach ($classname_ecole as $data)
                               <option value="{{ $data->id_ecole }}" > {{ $data->nom_ecole }}</option>
                                @endforeach
                              </select>
                            </form>
                            <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Autre école: ') }}</label> 
                                <input  id="diplome" type="text" class="form-control" name="diplome"  autofocus>
                            </div>
                        </div> 
                            </div>
                            </div>
                                                                                                               
                        <div class="form-group row"> 
                            <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Formation en cours: ') }}</label> 
                                <input id="formation" type="text" class="form-control @error('formation') is-invalid @enderror" name="formation">
                            </div>
                            </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                            <label class=" col-form-label text-md-right">{{ __('Domaine: ') }}</label> 
                           <form  size ="37" method="post" >
                           <select  class="form-control @error('domaine') is-invalid @enderror" name="domaine" value="{{ old('domaine') }}" autofocus>
                           <option value="">Choississez votre domaine</option>
                           @foreach ($classname_domaine as $data)
                          <option value="{{ $data->id_domaine }}" > {{ $data->label_domaine }}</option>
                          @endforeach
                          </select>
                          </form>
                          <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Autre domaine: ') }}</label> 
                            <input  id="diplome" type="text" class="form-control" name="diplome"  autofocus>
                        </div>
                         </div> 
                          </div>
                          </div> 
    
                          <div class="card-header">{{ __("Mon diplome : ") }}</div><br/>  
                          <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Dernier diplome: *') }}</label> 
                                <input  id="diplome" type="text" class="form-control @error('diplome') is-invalid @enderror" name="diplome"  autofocus>
                                @error('diplome')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                </div>
                            
                            <div class="col-md-6">
                                <form  size ="37" method="post" >
                                <label class=" col-form-label text-md-right">{{ __('Diplome actuel: *') }}</label> 
                               <select  class="form-control @error('dipactuel') is-invalid @enderror" name="dipactuel" value="{{ old('dipactuel') }}"  autofocus name="dipactuel" required >
                               <option value="">Choississez votre diplome actuel</option>
                               @foreach ($classname_niveau as $data)
                             <option value="{{ $data->id_niveau_diplome }}" > {{ $data->label_niveau_diplome }}</option>
                             @endforeach
                              </select>
                            </form>
                                @error('dipactuel')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                                <div class="form-group row">
                            <div class="col-md-6">
                            <label class=" col-form-label text-md-right">{{ __('Autre diplome: *') }}</label> 
                                <input  id="diplome" type="text" class="form-control" name="diplome"  autofocus>
                            </div>
                        </div> 
                        </div> 
                        </div> 
                        <div align="center" class="form-group">
                       <div class="col-md-12">
                        Tous les champs avec un * sont obligatoires !!
                        <div>
                       <label><input type="checkbox" name="condition" id="condition" required> En cochant cette case, j'accepte que mes informations saisies soient utilisées uniquement dans le cadre légale dans l'association.</label >
                       <!-- J'accepte <a href="mentionLegal">les thermes &amp; et les conditions</a> pour l'inscription.</label > -->
                       </div>
       
                                <button type="submit" class="btn btn-primary" name="register">
                                    {{ __("S'inscrire") }}
                                </button>
                                <p>Vous avez un compte ? <a href="connexion">Connectez-vous ici !!</a></p>
                            </div>
                        </div>
                    </form>
                    <!-- <div id="last_inserted_id"></div> -->
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
