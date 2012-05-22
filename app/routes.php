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
	return 'Hello World!';
});

/*
|--------------------------------------------------------------------------
| Application Events
|--------------------------------------------------------------------------
|
| These events run before and after requests to your application and
| are very useful for pre and post processing. By default they're
| responsible for starting and finishing the session handling.
|
*/

$app->before(function($request) use ($app)
{
	$app['session']->start($request);
});


$app->after(function($request, $response) use ($app)
{
	$app['session']->finish($response, $app['cookie']);
});