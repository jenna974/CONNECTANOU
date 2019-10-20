<?php

namespace App\Http\Controllers;

use App\Topic;

use App\Comment;
use Illuminate\Http\Request;


class CommentController extends Controller
{
    // On sait que l'on peut ajouter un commentaires que si l'on est connecté
    public function __construct()

    {
        $this->middleware('auth');
    }

    public function store(Topic $topic)
    {
        //on va enregistrer à travers la relation
        request()->validate([
        //le contenu obligatoire avec un minimum de 5 caractère
            'content' =>'required|min:5'
        ]);
            // création de nouveau comment
            $comment = new Comment();
            $comment->content = request('content');
            $comment->user_id = auth()->user()->id;
            // sauvegarder les commentaires permettra de remplir les champs qui concerne les relations polymorphique
            $topic->comments()->save($comment);

            return redirect()->route('topics.show',$topic);
    }

    public function storeCommentReply(Comment $comment)
    {
        request()->validate([
            'replyComment'=>'required|min:5'
        ]);

        $commentReply = new Comment();
        $commentReply->content = request('replyComment');
        $commentReply->user_id = auth()->user()->id;

        $comment->comments()->save($commentReply);

        
        return redirect()->back();
    }
}
