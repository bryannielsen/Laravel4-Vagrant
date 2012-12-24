<?php

$requested = __DIR__.'/public'.$_SERVER['REQUEST_URI'];
if ($_SERVER['REQUEST_URI'] !== '/' and file_exists($requested))
{
	return false;
}
require_once(__DIR__ . '/public/index.php');

