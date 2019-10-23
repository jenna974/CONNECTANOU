<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $guarded = [];
    
    public function commentable()
    {
        return $this->morphTo();
    }

    public function comments()
    {
        // Un commentaire auras plusieurs réponses
        return $this->morphMany('App\Comment','commentable')->latest();
    }

    public function user()
    {
        // ce commentaire appartient au modèle App\user
        return $this->belongsTo('App\user');
    }
}
