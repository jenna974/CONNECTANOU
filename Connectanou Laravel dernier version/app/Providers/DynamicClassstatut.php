<?php

namespace App\Providers;
use App\ClassModelstatut; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClassstatut extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_statut', ClassModelstatut::all());

});
}
}