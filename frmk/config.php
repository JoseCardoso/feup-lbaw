<?php
session_start();

defined("HOME_URL")
or define("HOME_URL", "http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'] );

defined("CSS_PATH")
or define("CSS_PATH", HOME_URL . 'css/');

defined("IMAGES_PATH")
or define("IMAGES_PATH", HOME_URL . "images/");

defined("DB_PATH")
or define("DB_PATH", realpath(dirname(__FILE__) . '/database/'));

defined("TEMPLATES_PATH")
or define("TEMPLATES_PATH", realpath(dirname(__FILE__) . '/templates/'));

date_default_timezone_set("Europe/Lisbon");
