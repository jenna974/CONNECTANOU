<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Client;
use App\User;
use Faker\Generator as Faker;

$factory->define(Client::class, function (Faker $faker) {
    return [
        'entreprise_id'=>factory('App\Entreprise')->create(),
        'name' => $faker->name,
        'email' => $faker-> safeEmail(),
        'status'=>1
    ];
});
