@component('mail::message')
# Bienvenu {{ $realisateur->name}}

Merci de vous être enregistré(e) avec l'adresse : {{ $realisateur->email}}
@endcomponent
