<?php

namespace App\Listeners;

use App\Mail\UserMail;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Mail;

class UserRegisteredListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        // C'est ici qu'on va envoyer un email pour certifier au nouveau user son inscription
        // on récupere les informations de l'utilisateur grâce à $event
        // cette action aura lieu lorsque l'event sera déclencher

        
        Mail::to($event->user->email)->send(new UserMail($event->user));

        
    }
}
