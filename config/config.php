<?php

// 微擎版
// require __DIR__ . '/../../../data/config.php';
// $stand = require __DIR__ . '/db.php';
// return [
//     'host' => $config['db']['master']['host'],
//     'port' => $config['db']['master']['port'],
//     'dbname' => $config['db']['master']['database'],
//     'username' => $config['db']['master']['username'],
//     'password' => $config['db']['master']['password'],
//     'tablePrefix' => $config['db']['master']['tablepre'],
//     'redis_password' => $stand['redis_password'],
//     'redis_port' => $stand['redis_port'],
//     'websoket_port' => $stand['websoket_port'],
//     'IS_W7' => true
// ];

// 独立版
$stand = require __DIR__ . '/db.php';
return [
    'host' => $stand['host'],
    'port' => $stand['port'],
    'dbname' => $stand['database'],
    'username' => $stand['username'],
    'password' => $stand['password'],
    'tablePrefix' => $stand['tablepre'],
    'redis_url' => !empty($stand['redis_url']) ? $stand['redis_url'] : '127.0.0.1',
    'redis_password' => $stand['redis_password'],
    'redis_port' => $stand['redis_port'],
    'websoket_port' => $stand['websoket_port'],
    'debug' => isset($stand['debug']) ? ($stand['debug'] == 1 ? true : false) : false,
    'IS_W7' => false
];

