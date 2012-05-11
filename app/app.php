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

require __DIR__.'/bulbs/default.php';

if (file_exists($bulb = __DIR__.'/bulbs/'.$app['env'].'.php'))
{
	require $bulb;
}

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