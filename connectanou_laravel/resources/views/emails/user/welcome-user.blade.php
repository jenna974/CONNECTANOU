@component('mail::message')
# Bienvenu {{ $user->name}}

Merci de vous être enregistré(e) avec l'adresse : {{ $user->email}}
@endcomponent
