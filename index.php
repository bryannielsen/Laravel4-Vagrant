<?php

require __DIR__.'/vendor/autoload.php';

Illuminate\Foundation\LightSwitch::flip();

$app = require_once __DIR__.'/app.php';

$app->run();