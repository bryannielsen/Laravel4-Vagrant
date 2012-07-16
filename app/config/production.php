<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| Application Debug Mode
	|--------------------------------------------------------------------------
	|
	| When your application is in debug mode, detailed error messages with
	| stack traces will be shown on every error that occurs within your
	| applications. When disabled, a simple, generic error is shown.
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
	| to any of the locales which are supported by your applications.
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
	| Static Facades
	|--------------------------------------------------------------------------
	|
	| When enabled, this allows access to most of the framework's parts via
	| a simple, terse static interfaces. But don't worry, it still makes
	| use of this application's IoC container for ease of testability.
	|
	*/

	'facade' => true,

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

	/*
	|--------------------------------------------------------------------------
	| Autoloaded Service Providers
	|--------------------------------------------------------------------------
	|
	| The service providers listed here will be automatically loaded on each
	| request to your application. Feel free to add your own services to
	| this array to give expanded functionality to your applications.
	|
	*/

	'providers' => array(

		'Illuminate\Foundation\Provider\AuthServiceProvider',
		'Illuminate\Foundation\Provider\BladeServiceProvider',
		'Illuminate\Foundation\Provider\CookieServiceProvider',
		'Illuminate\Foundation\Provider\EncrypterServiceProvider',
		'Illuminate\Foundation\Provider\EventsServiceProvider',
		'Illuminate\Foundation\Provider\FilesServiceProvider',
		'Illuminate\Foundation\Provider\SessionServiceProvider',
		'Illuminate\Foundation\Provider\SilexServiceProvider',
		'Illuminate\Foundation\Provider\ValidatorServiceProvider',

	),

);