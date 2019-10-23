<?php

use Illuminate\Database\Seeder;

class EntreprisesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory('App\Entreprise',15)->create();
    }
}
