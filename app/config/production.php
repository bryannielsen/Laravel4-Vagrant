<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| Application Debug Mode
	|--------------------------------------------------------------------------
	|
	| When your application is in debug mode, detailed error messages with
	| stack traces will be shown on every error that occurs within your
	| application. When disabled, a simple, generic error is shown.
	|
	*/

	'debug' => false,

	/*
	|--------------------------------------------------------------------------
	| Application Locale
	|--------------------------------------------------------------------------
	|
	| The application locale determines the default locale that will be used
	| by the translation service provider. You're free to set this value
	| to any of the locales which are supported by your application.
	|
	*/

	'locale' => 'en',

	'encrypter' => array(

		/*
		|--------------------------------------------------------------------------
		| Encryption Key
		|--------------------------------------------------------------------------
		|
		| This key is used by the Illuminate encrypter service and should be set
		| to a random, long string, otherwise your encrypted values will not
		| be safe. Be sure to change this before deploying your website!
		|
		*/

		'key' => 'YourSecretKey!',

	),

	'twig' => array(

		/*
		|--------------------------------------------------------------------------
		| Twig View Path
		|--------------------------------------------------------------------------
		|
		| Here you may define the location of your Twig views. A sensible path
		| has already been setup for you, so you probably don't need to do
		| anything here. Just start creating some beautiful templates!
		|
		*/

		'path' => __DIR__.'/../views',

		/*
		|--------------------------------------------------------------------------
		| Other Twig Options
		|--------------------------------------------------------------------------
		|
		| This array allows you to specify other Twig options. A list of all of
		| the options supported by Twig may be found in Twig's documentation
		| on the official Twig website. Any option may be specified here.
		|
		*/

		'options' => array(

			'auto_reload' => true,

			'cache' => __DIR__.'/../views/cache',

		),

	),

);