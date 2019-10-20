<?php

namespace App\Mail;

use App\realisateur;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class UserMail extends Mailable
{
    use Queueable, SerializesModels;

    //on passe la variable $user en public pour avoir accés dans le email
    
    public $realisateur;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(realisateur $realisateur)
    {
        $this->realisateur = $realisateur;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.realisateur.welcome-realisateur');
    }
}
