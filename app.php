<?php

$app = new Illuminate\Foundation\Application;

$app['debug'] = true;

$app->root(function() use ($app)
{
	return 'Hello World!';
});

return $app;