<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;


class ContactController extends Controller
{
    public function create()
    {
        return view('contact.create');
    }

    public function store()
    {
        request()->validate([
            'name'=>'required',
            'email'=>'required|email',
            'message'=>'required',
            'g-recaptcha-response' => 'required|captcha'
        ]);

        // la methode send() prend une nouvelle instance de notre contactMail
        Mail::to('test@test.com')->send(new ContactMail([

            'name'=>request('name'),
            'email'=>request('email'),
            'message'=>request('message')
        ]));
        
        //la methode flash() avec comme clé 'message' et le contenu du message
         session()->flash('message','Votre message à été bien envoyé!');

        return redirect('contact');
    }
}
