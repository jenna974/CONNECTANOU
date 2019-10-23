<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class diplome extends Model {

    public $timestamps = false;

    protected $fillable = ['desc_diplome', 'id_niveau_diplome','annee_obtention', ];

}