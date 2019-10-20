<?php

namespace App\Http\Controllers\Auth;

use App\Events\UserRegisteredEvent;
use App\realisateur;
use App\diplome;
use App\formation;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'nom' => ['required', 'string', 'max:255'],
            'prenom' => ['required', 'string', 'max:255'],
            'tel' => ['required'],
            'statut' => ['required'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
/*              'diplome' => ['required', 'string', 'max:255'],
            'dipactuel' => ['required', 'string', 'max:255'],  */
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\realisateur
     */

    // cette function va créer un nouvel utilisateur
    protected function create(array $data)
    {
        // create() renvoi l'instance d'utilisateur 
        $realisateur = realisateur::create([
            'name' => $data['nom'],
            'prenom_real' => $data['prenom'],
             'login_real' => $data['login'],
             'id_statut_real' => $data['statut'],
            //  'id_ecole' => $data['ecole'],
            'tel_real' => $data['tel'],
            'datenais_real' => $data['datenais'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),


/*            
            'id_formation' => $data['formation'],
            'id_domaine' => $data['domaine'],    */
        
        $diplome = diplome::create([
            // 'id_niveau_diplome' => $data['dipactuel'],
            'desc_diplome' => $data['diplome'],

        $formation = formation::create([
            'titre_formation' => $data['formation'],
        ])

        ])
        
        ]);

        //Event
        // On appel une nouvelle instance de notre event 
        //on veux récuperer les informations de $user

        event(new UserRegisteredEvent($realisateur));

        return $realisateur;
    }
}
