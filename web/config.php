<?php
session_start();

defined("HOME_URL")
or define("HOME_URL", "http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']);

defined("ASSETS_PATH")
or define("ASSETS_PATH", HOME_URL . 'assets');

defined("IMAGES_PATH")
or define("IMAGES_PATH", ASSETS_PATH . "/img/");

defined("DB_PATH")
or define("DB_PATH", realpath(dirname(__FILE__) . '/data'));

defined("UPLOADS_URL")
or define("UPLOADS_URL", HOME_URL . "/server/files");

defined("UPLOADS_PATH")
or define("UPLOADS_PATH", realpath(dirname(__FILE__) . '/server/files'));

defined("LOGIC_PATH")
or define("LOGIC_PATH", realpath(dirname(__FILE__) . '/logic'));

defined("TEMPLATES_PATH")
or define("TEMPLATES_PATH", realpath(dirname(__FILE__) . '/templates'));

date_default_timezone_set("Europe/Lisbon");
?>
