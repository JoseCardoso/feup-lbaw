<?php

include_once('../../config/config.php');

include($BASE_DB . '/user.php');

try {
    $username = strip_tags($_POST['username']);
    $password = $_POST['password'];

    /* Confirm data */
    // verifying username and password missing field

    if (empty($username) && empty($password))
        throw new Exception('username and password');

    // verifying username missing field
    if (empty($username))
        throw new Exception('username');

    // verifying password missing field
    if (empty($password))
        throw new Exception('password');

    list($logged, $user) = User::login($username, $password);

    if (!$logged) {
        // Check admin
        if ($user != null) {
            $_SESSION['adminid'] = $user;
            go('../../pages/admin/admin-home.php');
        }

        throw new Exception('login_failed');
    }

    $_SESSION['iduser'] = $user->id;
    $_SESSION['username'] = $user->username;
    $_SESSION['email'] = $user->email;

} catch (PDOException $e) {

} catch (Exception $e) {
    if (strcmp($e->getMessage(), 'username and password') === 0) {
        $_SESSION['field_errors']['username'] = 'Username field required';
        $_SESSION['field_errors']['password'] = 'Password field required';
    }
    else if (strcmp($e->getMessage(), 'username') === 0)
        $_SESSION['field_errors']['username'] = 'Username field required';
    else if (strcmp($e->getMessage(), 'password') === 0)
        $_SESSION['field_errors']['password'] = 'Password field required';
    else if (strcmp($e->getMessage(), 'login_failed') === 0)
        $_SESSION['error_messages']['login_failed'] = 'Invalid username or password';

    $_SESSION['form_values'] = $_POST;
    go($_SERVER['HTTP_REFERER']);
}

go('../../pages/users/profile.php');