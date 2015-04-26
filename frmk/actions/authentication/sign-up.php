<?php
include_once('../../config/paths-init.php');

include_once($BASE_DIR .'/database/authentication.php');

if (!$_POST['username'] || !$_POST['password'] || !$_POST['firstName'] || !$_POST['lastName'] || !$_POST['email'] || !$_POST['cityName']) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    include $BASE_DIR . 'pages/authentication/sign-up.php';
    exit;
}

$username = strip_tags($_POST['username']);
$password = $_POST['password'];
$firstName = strip_tags($_POST['firstName']);
$lastName = strip_tags($_POST['lastName']);
$email = strip_tags($_POST['email']);
$cityName = strip_tags($_POST['cityName']);

try {
    createUser($username, $password, $firstName, $lastName, $email, $cityName);
} catch (PDOException $e) {
    if (strpos($e->getMessage(), 'users_pkey') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate username';
        $_SESSION['field_errors']['username'] = 'Username already exists';
    }
    else $_SESSION['error_messages'][] = 'Error creating user';

    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
}
  $_SESSION['success_messages'][] = 'User registered successfully';
  header("Location: $BASE_URL");