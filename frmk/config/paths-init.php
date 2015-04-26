<?php

$BASE_DIR = realpath(dirname(__FILE__) . '/..');
$BASE_URL = dirname("http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']);

$BASE_CONFIG = $BASE_DIR . '/config/';
$BASE_DB = $BASE_DIR . '/database/';
$BASE_TEMPLATES = $BASE_DIR . '/templates/';

$CSS_PATH = $BASE_URL . "/css/";
$IMAGE_PATH = $BASE_URL . "/images/";
