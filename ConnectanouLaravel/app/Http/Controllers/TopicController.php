<?php

namespace App\Http\Controllers;

use App\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    // on pourra pas utiliser le CRUD tant que l'on est pas connecté
    // on va faire appel à un middleware
    public function __construct()
    {
        // On implémente un middleware d'authentification
        // On est obligé d'être authentifié pour accéder aux méthodes sauf pour index et show
        $this->middleware('auth')->except(['index','show']);
    }



    public function index()
    {
        // la méthodes latest() récupere tous les topic du plus récent au plus ancien et paginate() les affiches en fonction du nombre choisi
        $topics = Topic::latest()->paginate(10);

        //retourne la vue index qui est dans le dossier topics
        return view('topics.index',compact('topics'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('topics.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // On ajoute des régles de validation

        $request->validate([
            'title'=>'required|min:5',
            'content'=>'required|min:10',
            'g-recaptcha-response' => 'required|captcha'
        ]);

        $topic = auth()->user()->topics()->create([
            'title'=> request('title'),
            'content'=>request('content')
        ]);
        return redirect()->route('topics.show',$topic->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function show(Topic $topic)
    {
        return view('topics.show',compact('topic'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function edit(Topic $topic)
    {
        // avec la method authorize on est plus censé accéder au formulaire de modification si on est pas l'auteur du topic 
        $this->authorize('update',$topic);
        return view('topics.edit',compact('topic'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Topic $topic)
    {
        $this->authorize('update',$topic);
         // valide les informations 
        $data=$request->validate([

            'title' => 'required|min:5',
            'content' => 'required|min:10'
        ]);
        $topic->update($data);
        return redirect()->route('topics.show',$topic->id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function destroy(Topic $topic)
    {
        $this->authorize('delete', $topic);
        // on récupère notre modèle et lui passe la methode destroy()
        Topic::destroy($topic->id);
        return redirect('/');
    }
}
