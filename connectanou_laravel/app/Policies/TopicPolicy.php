<?php

namespace App\Policies;

use App\User;
use App\Topic;
use Illuminate\Auth\Access\HandlesAuthorization;

// Avec les policy permet de sécuriser certains partie du site
// 
class TopicPolicy
{
    use HandlesAuthorization;
    
    /**
     * Determine whether the user can view any topics.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the topic.
     *
     * @param  \App\User  $user
     * @param  \App\Topic  $topic
     * @return mixed
     */
    public function view(User $user, Topic $topic)
    {
        //
    }

    /**
     * Determine whether the user can create topics.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the topic.
     *
     * @param  \App\User  $user
     * @param  \App\Topic  $topic
     * @return mixed
     */
    public function update(User $user, Topic $topic)
    {
        // si l'id de l'utilisateur connecté et égale à celui qui à crée le topic retourne vrai
        return $user->id == $topic->user->id;
    }

    /**
     * Determine whether the user can delete the topic.
     *
     * @param  \App\User  $user
     * @param  \App\Topic  $topic
     * @return mixed
     */
    public function delete(User $user, Topic $topic)
    {   
        // meme logique que pour la fonction update
        return $user->id == $topic->user->id;
    }

    /**
     * Determine whether the user can restore the topic.
     *
     * @param  \App\User  $user
     * @param  \App\Topic  $topic
     * @return mixed
     */
    public function restore(User $user, Topic $topic)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the topic.
     *
     * @param  \App\User  $user
     * @param  \App\Topic  $topic
     * @return mixed
     */
    public function forceDelete(User $user, Topic $topic)
    {
        //
    }
}
