<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for your application.
| It's a breeze. Just tell Illuminate which URIs it should respond to
| and give it a Closure to execute when that URI is accessed. It is
| a walk in the park. Enjoy the simplicity of HTTP and routing.
|
*/

$app->before(function($request) use ($app)
{
	$app['session']->start($request);
});

$app->after(function($request, $response) use ($app)
{
	$app['session']->finish($response);
});

$app->get('/', function() use ($app)
{
	return 'Hello World!';
});