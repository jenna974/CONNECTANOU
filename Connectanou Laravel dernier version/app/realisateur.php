<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\realisateur as Authenticatable;

class realisateur extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    
protected $fillable = ['email', 'password', 'name', 'prenom_real', 'login_real', 'id_statut_real', 'tel_real', 'datenais_real', 'id_ecole', 'id_statut_real', 'id_formation', ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function topics() 
    {
        // un utilisateur peut avoir plusieurs topic
        return $this->hasMany('App\Topic');
    }
}
