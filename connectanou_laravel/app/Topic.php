<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


//php artisan make:model Topic -m -c -r permet la création du model Topic pour le forum. Le -m pour créer la migration, le -c pour créer un controller et -r pour la mise en place des différentes méthodes restfull

class Topic extends Model
{
    protected $guarded = [];
    public function user() 
    {

        return $this->belongsTo('App\User');
    }

    public function comments()
    {
        //morphMany prévoit plusieurs commentaires et la méthode latest() récupère les dernieres commentaires
        return $this->morphMany('App\Comment','commentable')->latest();
    }
}
