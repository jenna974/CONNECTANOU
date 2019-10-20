<?php

namespace App\Providers;
use App\ClassModelniveau; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClassniveau extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_niveau', ClassModelniveau::all());

});
}
}