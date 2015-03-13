<?php
require_once 'config.php';

$action = $_GET['action'] != '' ? $_GET['action'] : '';

switch ($action) {
	case 'signUp':
	include TEMPLATES_PATH . '/sign-up.php';
	break;

	case 'signIn':
	include TEMPLATES_PATH . '/sign-in.php';
	break;

	default:
	break;
}
?>
