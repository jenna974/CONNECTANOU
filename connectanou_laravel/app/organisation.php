<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class organisation extends Model {

    public $timestamps = false;

    protected $fillable = ['SIRET', 'raison_sociale', 'sigle_org', 'logo_URL', 'activite_org', 'tel_orga', 'nb_salaries', 'site_internet_org', 'adresse_org', 'id_cp', 'id_type_org', 'id_porteur',];

}