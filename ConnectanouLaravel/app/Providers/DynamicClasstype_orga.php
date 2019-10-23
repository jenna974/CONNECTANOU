<?php

namespace App\Providers;
use App\ClassModeltype_orga; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClasstype_orga extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_type_orga', ClassModeltype_orga::all());

});
}
}