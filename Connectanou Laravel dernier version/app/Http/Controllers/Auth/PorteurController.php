<?php

namespace App\Http\Controllers\Auth;

use App\Events\UserRegisteredEvent;
use App\porteur;
use App\organisation;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class PorteurController extends Controller
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
            // 'tel' => ['required'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],

        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\porteur
     */

    // cette function va créer un nouvel utilisateur
    protected function create(array $data)
    {
        // create() renvoi l'instance d'utilisateur 
        $porteur = porteur::create([
            'name' => $data['nom'],
            'prenom_porteur' => $data['prenom'],
            'login_porteur' => $data['login'],
            'id_org' => $data['type_orga'],
            'tel_porteur' => $data['telperso'],
            'poste_porteur' => $data['poste'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),

        $organisation = organisation::create([
            'SIRET' => $data['siret'],
            'raison_sociale' => $data['raison'],
            'sigle_org' => $data['sigle'],
            'logo_URL' => $data['logo'],
            'activite_org' => $data['activite'],
            'tel_orga' => $data['tel_orga'],
            'nb_salaries' => $data['effectif'],
            'site_internet_org' => $data['site'],
            'adresse_org' => $data['adresse'],
            // 'id_cp' => $data['postal'],
        ])

        ]);

        //Event
        // On appel une nouvelle instance de notre event 
        //on veux récuperer les informations de $porteur

        event(new UserRegisteredEvent($porteur));

        return $porteur;
    }
}
