<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class formation extends Model {

    public $timestamps = false;

    protected $fillable = ['titre_formation', 'date_debut_formation', 'date_fin_formation', 'specialisation_formation', 'id_domaine', 'id_niveau_diplome', 'id_ecole',];

}