<?php

$app->detectEnvironment(array(

	'local' => array('localhost', 'illuminate.app'),

));

require __DIR__.'/bulbs/default.php';

if (file_exists($bulb = __DIR__.'/bulbs/'.$app['env'].'.php'))
{
	require $bulb;
}

require __DIR__.'/routes.php';

return $app;