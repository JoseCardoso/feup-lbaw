<?php

//facebook_session
//require_once($BASE_API . 'facebook_sdk/autoload.php');

//session_set_cookie_params(3600, '/~lbaw1424');
session_start();

//Facebook App Details
//include_once('fb.php');

error_reporting(E_ERROR | E_WARNING); // E_NOTICE by default

date_default_timezone_set('Europe/Lisbon');

$connection = new PDO('pgsql:host=vdbm.fe.up.pt;dbname=lbaw1424', 'lbaw1424', 'gF576kv0');
$connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$connection->exec('SET SCHEMA \'askfeup\'');

include_once($BASE_DIR . '/lib/smarty/Smarty.class.php');

$smarty = new Smarty;

$smarty->setTemplateDir($BASE_DIR . '/templates/');
$smarty->setCompileDir($BASE_DIR . '/templates_c/');
$smarty->setConfigDir($BASE_DIR . '/config/');

$smarty->assign('BASE_URL', $BASE_URL);
$smarty->assign('CSS_PATH', $CSS_PATH);
$smarty->assign('IMAGE_PATH', $IMAGE_PATH);

$smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
$smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
$smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
$smarty->assign('FORM_VALUES', $_SESSION['form_values']);
$smarty->assign('USERNAME', $_SESSION['username']);

//unset($_SESSION['success_messages']);
//unset($_SESSION['error_messages']);
//unset($_SESSION['field_errors']);
//unset($_SESSION['form_values']);

