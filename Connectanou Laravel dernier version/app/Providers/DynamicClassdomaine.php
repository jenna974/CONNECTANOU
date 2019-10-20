<?php

namespace App\Providers;
use App\ClassModeldomaine; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClassdomaine extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_domaine', ClassModeldomaine::all());

});
}
}