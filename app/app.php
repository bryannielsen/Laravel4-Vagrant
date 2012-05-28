<?php

/*
|--------------------------------------------------------------------------
| Detect The Application Environment
|--------------------------------------------------------------------------
|
| Illuminate takes a dead simple approach to application environments.
| Just specify the hosts that belong to a given environment, and we
| will quickly detect and set the application environment for you.
|
*/

$app->detectEnvironment(array(

	'local' => array('localhost', '*.dev'),

));

/*
|--------------------------------------------------------------------------
| Load The Environment Bulb
|--------------------------------------------------------------------------
|
| You may specify a "bulb" for each environment. The default bulb will be
| included on every request and the environment bulb gives a chance to
| customize the application such as tweaking the IoC bindings, etc.
|
*/

$config = array();

if (file_exists($bulb = __DIR__.'/bulbs/production.php'))
{
	$config = require $bulb;
}

if (file_exists($bulb = __DIR__.'/bulbs/'.$app['env'].'.php'))
{
	$config = array_merge($config, require $bulb);
}

/*
|--------------------------------------------------------------------------
| Set The Application Configuration
|--------------------------------------------------------------------------
|
| Now that we have the configuration array, we can set the values on the
| application instance using "dot" syntax. This will make the options
| available to all of the services that will also to be registered.
|
*/

foreach (array_dot($config) as $key => $value)
{
	$app[$key] = $value;
}

/*
|--------------------------------------------------------------------------
| Register The Core Service Provider
|--------------------------------------------------------------------------
|
| The Illuminate core service provider registers all of the core pieces
| of the Illuminate framework including session, caching, encryption
| and more. It's simply a convenient wrapper for the registration.
|
*/

$app->register(new Illuminate\Foundation\CoreServiceProvider);

/*
|--------------------------------------------------------------------------
| Load The Application Routes
|--------------------------------------------------------------------------
|
| The Application routes are kept separate from the application starting
| just to keep the file a little cleaner. We'll go ahead and load in
| all of the routes now and return the application to the caller.
|
*/

require __DIR__.'/routes.php';

return $app;