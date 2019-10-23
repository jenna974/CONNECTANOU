<?php

namespace App\Http\Controllers;
use DB;

use Illuminate\Http\Request;

class LastIdController extends Controller
{
    public function getid()
    {
      $id = DB::table('realisateurs')

      ->insertGetId(

          ['name' => 'Akash Savani', 'email'=>'akash@gmail.com']

      );

return $id;
    }

    
}

