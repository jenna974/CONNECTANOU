@component('mail::message')
# Bonjour

Vous avez reçu un mail de la part de {{$data['name']}}({{$data['email']}})


<strong>Message : </strong> <br>
{{ $data['message'] }}
@component('mail::button', ['url' => ''])
Button Text
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
