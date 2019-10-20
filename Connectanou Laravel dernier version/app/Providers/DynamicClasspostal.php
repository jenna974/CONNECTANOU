<?php

namespace App\Providers;
use App\ClassModelpostal; // write model name here
use Illuminate\Support\ServiceProvider;
class DynamicClasspostal extends ServiceProvider
{
public function boot()
{
view()->composer('*',function($view){
$view->with('classname_postal', ClassModelpostal::all());

});
}
}