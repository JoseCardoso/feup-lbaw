<?php

$BASE_DIR = realpath(dirname(__FILE__) . '/..');
$BASE_URL = dirname("http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']);

$BASE_TEMPLATES = $BASE_DIR . '/templates/';
$BASE_CONFIG = $BASE_DIR . '/config/';

$CSS_PATH = $BASE_URL . "/css/";
$IMAGE_PATH = $BASE_URL . "/images/";
