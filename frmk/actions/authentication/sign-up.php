<?php

include_once('../../config/config.php');

include($BASE_DB . '/user.php');

try {
    /* Get values from hidden url */
    $username = strip_tags($_POST['username']);
    $password = $_POST['password'];
    $passwordConfirm = $_POST['passwordConfirm'];
    $firstName = strip_tags($_POST['firstName']);
    $lastName = strip_tags($_POST['lastName']);
    $email = strip_tags($_POST['email']);


    /* Confirm data */
    if (!isset($username))
        die('No username');
    if (!isset($password))
        die('No password');
    if (!isset($passwordConfirm))
        die('No password confirmation');
    if (!isset($firstName))
        die('No first name');
    if (!isset($lastName))
        die('No last name');
    if (!isset($email))
        die('No email');

    /* Creating user */
   $user = User::register($username, $password, $firstName, $lastName, $email);

    if($user === false) {
        $error = "Failed in create user.";
        throw new Exception($error);
    }

    /* Filling session with that user info to sign in directly after sign up submission */
    $_SESSION['iduser'] = $user->id;
    $_SESSION['username'] = $user->username;
    $_SESSION['lastlogin_at'] = $user->lastLogin_at;
    $_SESSION['register_at'] = $user->register_at;

    $_SESSION['success_messages'][] = 'User registered successfully';

    go('../../pages/menus/explore.php');

} catch (Exception $e) {
    echo nl2br("\r\n" . "Exception caught: ". $e->getMessage());
    exit();
    //go('../../pages/authentication/sign-up.php');
}

/*
// check if there is already a user with the requested username
$stmt = $dbh->prepare(
    'SELECT * FROM User
    WHERE username = ?');
$stmt->execute(array($username));
if($stmt->fetch()) {
    $_SESSION['responseContent'] = 'That username is already taken.';
    header("Location: index.php?page=signUp");
    exit;
}

// inserting user into database
$stmt = $dbh->prepare(
    'INSERT INTO User
    (username, password, lastLoginDate, registerDate, gender)
    VALUES (?, ?, ?, ?, ?)');
$stmt->execute(array(
    $username,
    hash('sha256', $password),
    date('Y-m-d H:i:s'),
    date('Y-m-d H:i:s'),
    $gender));

// getting user that has just sign up
$stmt = $dbh->prepare(
    'SELECT * FROM User
    WHERE username = ?
    AND password = ?');
$stmt->execute(array($username, hash('sha256', $password)));
if (!($user = $stmt->fetch())) {
    $_SESSION['responseContent'] = 'Unexpected error after sign up: invalid username or password.';
    header("Location: index.php?page=signIn");
    exit;
}
*/
