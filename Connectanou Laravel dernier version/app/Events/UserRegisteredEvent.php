<?php

namespace App\Events;

use App\realisateur;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class UserRegisteredEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    //on passe la variable $user en public pour avoir accés dans le listener
    public $realisateur;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(realisateur $realisateur)
    {
        $this->realisateur = $realisateur;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
