<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| Application Debug Mode
	|--------------------------------------------------------------------------
	|
	| When your application is in debug mode, detailed error messages with
	| stack traces will be shown on every error that occurs within your
	| application. If disabled, a simple generic error page is shown.
	|
	*/

	'debug' => true,

	/*
	|--------------------------------------------------------------------------
	| Application Timezone
	|--------------------------------------------------------------------------
	|
	| Here you may specify the default timezone for your application, which
	| will be used by the PHP date and date-time functions. We have gone
	| ahead and set this to a sensible default for you out of the box.
	|
	*/

	'timezone' => 'UTC',

	/*
	|--------------------------------------------------------------------------
	| Application Locale Configuration
	|--------------------------------------------------------------------------
	|
	| The application locale determines the default locale that will be used
	| by the translation service provider. You are free to set this value
	| to any of the locales which will be supported by the application.
	|
	*/

	'locale' => 'en',

	/*
	|--------------------------------------------------------------------------
	| Application Fallback Locale
	|--------------------------------------------------------------------------
	|
	| The fallback locale determines the locale to use when the current one
	| is not available. You may change the value to correspond to any of
	| the language folders that are provided through your application.
	|
	*/

	'fallback_locale' => 'en',

	/*
	|--------------------------------------------------------------------------
	| Encryption Key
	|--------------------------------------------------------------------------
	|
	| This key is used by the Illuminate encrypter service and should be set
	| to a random, long string, otherwise these encrypted values will not
	| be safe. Make sure to change it before deploying any application!
	|
	*/

	'key' => 'YourSecretKey!!!',

	/*
	|--------------------------------------------------------------------------
	| Autoloaded Service Providers
	|--------------------------------------------------------------------------
	|
	| The service providers listed here will be automatically loaded on the
	| request to your application. Feel free to add your own services to
	| this array to grant expanded functionality to your applications.
	|
	*/

	'providers' => array(

		'Illuminate\Foundation\Providers\ArtisanServiceProvider',
		'Illuminate\Auth\AuthServiceProvider',
		'Illuminate\Cache\CacheServiceProvider',
		'Illuminate\Foundation\Providers\ComposerServiceProvider',
		'Illuminate\Routing\ControllerServiceProvider',
		'Illuminate\CookieServiceProvider',
		'Illuminate\Database\DatabaseServiceProvider',
		'Illuminate\EncryptionServiceProvider',
		'Illuminate\Events\EventServiceProvider',
		'Illuminate\FilesystemServiceProvider',
		'Illuminate\Hashing\HashServiceProvider',
		'Illuminate\Log\LogServiceProvider',
		'Illuminate\Mail\MailServiceProvider',
		'Illuminate\Database\MigrationServiceProvider',
		'Illuminate\Pagination\PaginationServiceProvider',
		'Illuminate\Foundation\Providers\PublisherServiceProvider',
		'Illuminate\Redis\RedisServiceProvider',
		'Illuminate\Database\SeedServiceProvider',
		'Illuminate\Session\SessionServiceProvider',
		'Illuminate\Translation\TranslationServiceProvider',
		'Illuminate\Validation\ValidationServiceProvider',
		'Illuminate\View\ViewServiceProvider',

	),

	/*
	|--------------------------------------------------------------------------
	| Class Aliases
	|--------------------------------------------------------------------------
	|
	| This array of class aliases will be registered when this application
	| is started. However, feel free to register as many as you wish as
	| the aliases are "lazy" loaded so they don't hinder performance.
	|
	*/

	'aliases' => array(

		'App'        => 'Illuminate\Foundation\Facades\App',
		'Artisan'    => 'Illuminate\Foundation\Facades\Artisan',
		'Auth'       => 'Illuminate\Foundation\Facades\Auth',
		'Cache'      => 'Illuminate\Foundation\Facades\Cache',
		'Config'     => 'Illuminate\Foundation\Facades\Config',
		'Controller' => 'Illuminate\Routing\Controllers\Controller',
		'Cookie'     => 'Illuminate\Foundation\Facades\Cookie',
		'Crypt'      => 'Illuminate\Foundation\Facades\Crypt',
		'DB'         => 'Illuminate\Foundation\Facades\DB',
		'Eloquent'   => 'Illuminate\Database\Eloquent\Model',
		'Event'      => 'Illuminate\Foundation\Facades\Event',
		'File'       => 'Illuminate\Foundation\Facades\File',
		'Hash'       => 'Illuminate\Foundation\Facades\Hash',
		'Input'      => 'Illuminate\Foundation\Facades\Input',
		'Lang'       => 'Illuminate\Foundation\Facades\Lang',
		'Log'        => 'Illuminate\Foundation\Facades\Log',
		'Mail'       => 'Illuminate\Foundation\Facades\Mail',
		'Paginator'  => 'Illuminate\Foundation\Facades\Paginator',
		'Redirect'   => 'Illuminate\Foundation\Facades\Redirect',
		'Redis'      => 'Illuminate\Foundation\Facades\Redis',
		'Request'    => 'Illuminate\Foundation\Facades\Request',
		'Response'   => 'Illuminate\Foundation\Facades\Response',
		'Route'      => 'Illuminate\Foundation\Facades\Route',
		'Schema'     => 'Illuminate\Foundation\Facades\Schema',
		'Session'    => 'Illuminate\Foundation\Facades\Session',
		'URL'        => 'Illuminate\Foundation\Facades\URL',
		'Validator'  => 'Illuminate\Foundation\Facades\Validator',
		'View'       => 'Illuminate\Foundation\Facades\View',

	),

);
