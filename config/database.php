<?php

use Illuminate\Support\Str;

$config = require 'config.php';
return [

    'default' => 'mysql',
    'connections' => [

        'mysql' => [
            'driver' => 'mysql',
            'url' => env('DATABASE_URL'),
            'host' => $config['host'],
            'port' => $config['port'],
            'database' => $config['dbname'],
            'username' => $config['username'],
            'password' => $config['password'],
            'unix_socket' => '',
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => $config['tablePrefix'],
            'prefix_indexes' => true,
            'strict' => false,
            'engine' => null,
            'options'   => [
                PDO::ATTR_EMULATE_PREPARES  => true,
            ],
        ],
    ],


    'redis' => [
        'client' =>  env('REDIS_CLIENT', 'phpredis'),
        'options' => [
            'cluster' => 'redis',
            'prefix' => 'baisheng_'
        ],
        'default' => [
            'url' => env('REDIS_URL'),
            'host' => !empty($config['redis_url']) ? $config['redis_url'] : '127.0.0.1',
            'password' => $config['redis_password'],
            'port' => $config['redis_port'],
            'database' => '0',
        ],
        'cache' => [
            'url' => env('REDIS_URL'),
            'host' => !empty($config['redis_url']) ? $config['redis_url'] : '127.0.0.1',
            'password' => $config['redis_password'],
            'port' => $config['redis_port'],
            'database' => '1',
        ],
        'queue' => [
            'driver' => 'redis',
            'connection' => 'default',
            'queue' => 'default',
            'expire' => 60,
        ],

    ],

];
