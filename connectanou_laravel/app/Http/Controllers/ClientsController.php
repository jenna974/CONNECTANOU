<?php

namespace App\Http\Controllers;

use App\Client;
use App\Entreprise;
use Illuminate\Http\Request;

// php artisan make:controller ClientsController
class ClientsController extends Controller

{
    //Avec le middleware('auth') l'user doit être obligatoirement connecté pour y acceder pour toutes les routes qui concernent "clients"

    //->except() permet de restreindre les methodes sauf 1 ou plusieurs 
    public function __construct()
    {
       $this->middleware('auth')->except(['index']); 
    }


    public function index() 
    {
    // la fonction index permet de créer un tableau et renvoyer la view
    // permet de passer des données à une view

    // On utilise ici la méthode where de eloquent
    // la clause where ici récupere que les clients actif donc = 1

    $clients = Client::all();
    // $Client = Client::where('status','=',1)->get();
    
    // fait appel au scope de status dans le model Client
    // $clients = Client::status();
    
    return view('clients.index',compact('clients','entreprises'));
    // return view('clients.index',[
    //     'clients'=> $clients
    // ]);

    

    }

    public function store()
    {
        // contrôle si les champs sont complet sinon nous retourne une erreur
        // A voir les régles de validation dans la documentation de laravel

        // la methode renvoie des données ici un array
        $data = request()->validate([
            'name'=> 'required|min:3', // On veut un pseudo d'au moins 3 caractère
            'email'=>'required|email',
            'status'=>'required|integer',
            'entreprise_id'=>'required|integer'
        ]);
       
        Client::create($data);

        // $name = request('name');
        // $email = request('email');
        // $status = request('status');

        // //crée un nouveau client avec new client();
        // $Client = new Client();
        // //le nom et l'email du nouveau client est celui de la saisie
        // $Client->name = $name;
        // $Client->email = $email;
        // $Client->status =$status;
        // $Client->save();

     

        // A la fin de la function nous retourne sur la page du formulaire
        return back();
    }

    public function create()
    {
        $this->authorize('create','Client::class');
        $entreprises = Entreprise::all();
        $client = new Client();
        return view('clients.create',compact('entreprises','client'));
        // return view('clients.create');
    }

    // la variable dans la fonction show hérite du model Client et récupere lle client qui correspond a l'id ou sinon retourne une page 404 
    //*route model binding
    public function show(Client $client)
    {
        return view('clients.show',compact('client'));
    }

    public function edit(Client $client)
    {
        $entreprises = Entreprise::all();
        return view('clients.edit',compact('client','entreprises'));
    }

    public function update(Client $client)
    {
        $data = request()->validate([
            'name'=> 'required|min:3', 
            'email'=>'required|email',
            'status'=>'required|integer',
            'entreprise_id'=>'required|integer'
        ]);

        $client->update($data);
        return redirect('clients/'.$client->id);
    }

    public function destroy(Client $client)
    {
        $client->delete();

        return redirect('clients');
    }
}