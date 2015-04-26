<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

if (!$_POST['username'] || !$_POST['password'] || !$_POST['primeiroNome'] || !$_POST['ultimoNome']) || !$_POST['email'] {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/authentication/sign-up.php');
    exit;
}

$username = strip_tags($_POST['username']);
$password = $_POST['password'];
$firstName = strip_tags($_POST['primeiroNome']);
$lastName = strip_tags($_POST['ultimoNome']);
$email = strip_tags($_POST['email']);

try {
    createUser($username, $password);
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