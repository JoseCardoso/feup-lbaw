<?php

include_once('../../config/config.php');

include($BASE_DB . '/user.php');

try {
    /* Get values from hidden url */
    $username = strip_tags($_POST['username']);
    $password = $_POST['password'];
    $password_confirmation = $_POST['passwordConfirm'];
    $first_name = strip_tags($_POST['firstName']);
    $last_name = strip_tags($_POST['lastName']);
    $email = strip_tags($_POST['email']);

    /* Confirm data */
    // verifying all missing fields
    if (empty($username) && empty($password) && empty($password_confirmation) && empty($first_name) && empty($last_name) && empty($email))
        throw new Exception('missing_all_fields');

    if($password !== $password_confirmation)
        throw new Exception('password_not_match');

        /* Creating user */
    $user = User::register($username, $password, $first_name, $last_name, $email);

    if ($user === false)
        throw new Exception('register_failed');

    /* Filling session with that user info to sign in directly after sign up submission */
    $_SESSION['iduser'] = $user->id;
    $_SESSION['username'] = $user->username;
    $_SESSION['lastlogin_at'] = $user->lastLogin_at;
    $_SESSION['register_at'] = $user->register_at;

} catch (Exception $e) {
    if (strcmp($e->getMessage(), 'missing_all_fields') === 0)
        $_SESSION['field_errors']['missed_fields'] = 'All fields are required';
    else if(strcmp($e->getMessage(), 'register_failed') === 0)
        $_SESSION['error_messages']['register'] = 'Register failed';
    else if(strcmp($e->getMessage(), 'password_not_match') === 0)
        $_SESSION['error_messages']['password'] = 'Password not match';

    $_SESSION['form_values'] = $_POST;
    go($_SERVER['HTTP_REFERER']);
}

$_SESSION['success_messages'][] = 'User registered successfully';

go('../../pages/menus/explore.php');
