<?php

/*
|--------------------------------------------------------------------------
| Build The Application For The Production Environment
|--------------------------------------------------------------------------
|
| Here you may tweak the application for your production environment such
| as connecting to your production databases, or registering the cache
| driver used by your production environment. This is the real deal!
|
*/

$app['debug'] = false;

/*
|--------------------------------------------------------------------------
| Register The Twig Service Provider
|--------------------------------------------------------------------------
|
| Twig is a beautiful templating system for your application, including
| advanced features such as template inheritance and blocks. Twig is
| already setup for you! Just start creating some beautiful views!
|
*/

$viewPath = __DIR__.'/../views';

$app->register(new Silex\Provider\TwigServiceProvider, array(

	'twig.path' => $viewPath,

	'twig.options' => array(

		'auto_reload' => true,

		'cache' => $viewPath.'/cache'

	),

));

/*
|--------------------------------------------------------------------------
| Register The Base Service Provider
|--------------------------------------------------------------------------
|
| The Illuminate base service provider registers all of the core pieces
| of the Illuminate framework including session, caching, encryption
| and more. It's simply a convenient wrapper for the registration.
|
*/

$app->register(new Illuminate\Foundation\BaseServiceProvider);

/*
|--------------------------------------------------------------------------
| Set The Application Encryption Key
|--------------------------------------------------------------------------
|
| This key is used by the Illuminate encrypter service and should be set
| to a random, long string, otherwise your encrypted values will not
| be secure. Be sure to change this before deploying your website!
|
*/

$app['encrypter.key'] = 'YourSecretKey!';