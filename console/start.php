<?php

/*
|--------------------------------------------------------------------------
| Turn On The Lights
|--------------------------------------------------------------------------
|
| We need to illuminate PHP development, so let's turn on the lights.
| This bootstrap the framework and gets it ready for use, then it
| will load up this application so that we can run it and send
| the responses back to the browser and delight these users.
|
*/

$app = require_once __DIR__.'/../start.php';

/*
|--------------------------------------------------------------------------
| Create The Artisan Application
|--------------------------------------------------------------------------
|
| Now we're ready to create the Artisan console application, which will
| be responsible for running the appropriate command. The console is
| built on top of the robust, powerful Symfony console components.
|
*/

use Illuminate\Console\Application;

$artisan = new Application('Laravel Framework', LARAVEL_VERSION);

$artisan->setLaravel($app);

/*
|--------------------------------------------------------------------------
| Register The Artisan Commands
|--------------------------------------------------------------------------
|
| Each available Artisan command must be registered with the console so
| that it is available to be called. We'll register every command so
| the console gets access to each of the command object instances.
|
*/

require $app['path'].'/artisan/start.php';

return $artisan;