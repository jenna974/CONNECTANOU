{{-- héritage de la view layouts/app.blade.php --}}
@extends('layouts.app')

@section('extra-js')
    <script>
        // on cible le bon commentaire grâce à son id
        function toggleReplyComment(id) 
        {
            let element = document.getElementById('replyComment-' + id);
            // au clic si le toggle existe on l'ajoute dans le cas contraire on la retire
            element.classList.toggle('d-none');
            
        }
    </script>
@endsection

@section('content')
<div class="container">
        <h1></h1>
        <div class="card">
            <div class="card-body">
            <h5 class="card-title">{{$topic->title}}</h5>
            <p>{{$topic->content}}</p>
            <div class="d-flex justify-content-between align-items-center ">
                <small>
                    Posté le {{ $topic->created_at->format('d/m/y ')  }}
                </small>  
                <span class="badge badge-primary">{{$topic->user->name }}</span>

                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    {{--le token @can permet de cacher les boutons mais ne supprime pas la route /edit --}}
                    @can('update', $topic)
                    <a href="{{ route('topics.edit',$topic) }}" class="btn btn-warning">Editer ce topic</a>   
                    @endcan
                
                     @can('delete', $topic)
                    <form action="{{ route('topics.destroy', $topic )}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Supprimer</button>
                    </form>     
                     @endcan              
                </div>
            </div>
        </div>
        <hr>
        
        <h5>Commentaires</h5>
        
        {{-- recupere les informations et affiche les commentaires dans un espace dédié sinon affiche le message dans le token @empty --}}
        @forelse ($topic->comments as $comment)
            <div class="card mb-2">
                <div class="card-body">
                    {{$comment->content}}
                    <div class="d-flex justify-content-between align-items-center">
                        <small>
                            Posté le {{ $comment->created_at->format('d/m/y')  }}
                        </small>  
                        <span class="badge badge-primary">{{$comment->user->name }}</span>
                    </div>
                </div>
            </div>
            @foreach ($comment->comments as $replyComment)
                <div class="card mb-2 ml-5">
                    <div class="card-body">
                        {{$replyComment->content}}
                        <div class="d-flex justify-content-between align-items-center">
                            <small>
                                Posté le {{ $replyComment->created_at->format('d/m/y')  }}
                            </small>  
                            <span class="badge badge-primary">{{$replyComment->user->name }}</span>
                        </div>
                    </div>
                </div>
            @endforeach
            @auth
            <button class="btn btn-info mb-3 " onclick="toggleReplyComment({{$comment->id}}) ">Répondre</button>
                
                <form action="{{ route('comments.storeReply',$comment)}}" method="POST" class="mb-3 ml-5 d-none" id="replyComment-{{$comment->id}}">
                    @csrf
                    <div class="form-group">
                        <label for="replyComment">Ma réponse</label>
                        <textarea name="replyComment" class="form-control @error('replyComment')is-invalid @enderror" id="replyComment"  rows="3"></textarea>
                        @error('replyComment')
                            <div class="invalid-feedback">{{ $errors->first('replyComment')}}</div>
                        @enderror
                        </div>
                        <button type="submit" class="btn btn-primary mb-3">Répondre à ce commentaire</button>
                    </form>
            @endauth
            
        @empty
            <div class="alert alert-info">Aucun commentaire pour ce topic</div>
        @endforelse
        <form action="{{ route('comments.store',$topic) }}" method="POST" class="mt-3">
            @csrf
            <div class="form-group">
                <label for="content">Votre commentaire</label>
                {{-- @error   @enderror pour le systeme de validation --}}
                <textarea class="form-control @error('content') is-invalid @enderror" name="content" id="content"  rows="5"></textarea>
                @error('content')
                    <div class="invalid-feedback">
                        {{$errors->first('content')}}
                    </div>
                @enderror
            </div>
        
            <button type="submit" class="btn btn-primary">Soumettre mon commentaire</button>
        </form>
    </div>
   

@endsection









