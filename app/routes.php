<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for your application.
| It's a breeze. Just tell Illuminate which URIs it should respond to
| and give it a Closure to execute when that URI is accessed. It is
| a walk in the park. Enjoy the simplicity of HTTP based routing.
|
*/

$app->get('/', function() use ($app)
{
	return $app->blade->render('hello.blade.php');
});