<?php

// Simple router for PHP built-in server to handle Laravel API routes
require_once __DIR__ . '/../vendor/autoload.php';

// Bootstrap Laravel
$app = require_once __DIR__ . '/../bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Get the request
$request = Illuminate\Http\Request::capture();

// Route the request to Laravel
$response = $app->handle($request);

// Send the response
$response->send();
