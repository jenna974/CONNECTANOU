<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Entreprise extends Model
{
    // peux importe les champs rempli la bdd va les accepter
    protected $guarded = [];

    // l'entreprise a une fonction qui récupére les clients qu'il détient
    public function clients()
    {
        return $this->hasMany('App\Client');
    }
}
