<?php

//require_once 'config.php';
include_once('config/paths-init.php');
include_once('config/init.php');

$action = $_GET['action'] != '' ? $_GET['action'] : '';

switch ($action) {
    default:
        break;

    case 'signIn':
        include 'actions/authentication/sign-in.php';
        break;

    case 'signUp':
        include 'actions/authentication/sign-up.php';
        break;

    case 'passwordRecovery':
        include 'actions/authentication/password-recovery.php';
        break;
}
