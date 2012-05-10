<?php

$app['debug'] = true;

$app->root(function() use ($app)
{
	return 'Hello World!';
});

return $app;