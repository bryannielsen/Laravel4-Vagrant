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

	'locale_fallback' => 'en',

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

	'encrypter.key' => 'YourSecretKey!',

	/*
	|--------------------------------------------------------------------------
	| Blade View Path
	|--------------------------------------------------------------------------
	|
	| Here you may define the location of your Blade views. A sensible path
	| has already been setup for you, so you probably don't need to do
	| anything here. Just start creating some beautiful templates!
	|
	*/

	'blade.path' => __DIR__.'/../views',

	/*
	|--------------------------------------------------------------------------
	| Blade Cache Path
	|--------------------------------------------------------------------------
	|
	| The Blade cache path determines where your compiled Blade view will be
	| stored on disk. Blade compiles templates down to plain PHP files so
	| your views can be rendered extremely fast. It is like fresh air.
	|
	*/

	'blade.cache' => __DIR__.'/../views/cache',

);