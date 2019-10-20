<?php

namespace App\Providers;
use App\ClassModelville; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClassville extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_ville', ClassModelville::all());

});
}
}