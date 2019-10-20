<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    // protected $fillable = ['name','email','status'];

    //ou
     protected $guarded = [];
    // même principe que protected $fillable = ['name','email','status'];
    protected $attributes = [
        'status'=>1
    ];

    public function scopeStatus($query)
    {
        // On utilise ici la méthode where de eloquent
        // la clause where ici récupere que les clients actif donc = 1

        return $query->where('status',1)->get();
    }

    public function entreprise()
    {   
        // le client a une fonction qui récupere l'entriprise à laquelle il appartient
        return $this->belongsTo('App\Entreprise');
    }

    public function getStatusAttribute($attributes)
    {
       return $this->getStatusOptions()[$attributes];
    }

    public function getStatusOptions()
    {
        return[
            '0'=>'Inactif',
            '1'=>'Actif',
            '2'=>'En attente'
        ];
    }
}
