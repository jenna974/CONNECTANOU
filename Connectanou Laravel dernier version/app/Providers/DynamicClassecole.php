<?php

namespace App\Providers;
use App\ClassModelecole; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClassecole extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_ecole', ClassModelecole::all());

});
}
}