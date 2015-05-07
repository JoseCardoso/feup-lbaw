<?php

include_once('../../config/config.php');

include ($BASE_DB . '/authentication.php');

try {
	/*
	if (... || !$_POST['cityName']) {
		$_SESSION['error_messages'][] = 'All fields are mandatory';
		$_SESSION['form_values'] = $_POST;

		header("Location: index.php?page=signUp");
		exit;
	}
	*/

	$username = strip_tags($_POST['username']);
	$password = $_POST['password'];
	$passwordConfirm = $_POST['passwordConfirm'];
	$firstName = strip_tags($_POST['firstName']);
	$lastName = strip_tags($_POST['lastName']);
	$email = strip_tags($_POST['email']);
	$cityName = strip_tags($_POST['cityName']);

	if (!isset($username)) die('No username');
	if (!isset($password)) die('No password');
	if (!isset($passwordConfirm)) die('No password confirmation');
	if (!isset($firstName)) die('No first name');
	if (!isset($lastName)) die('No last name');
	if (!isset($email)) die('No email');
	if (!isset($cityName)) die('No city');

    createUser($username, $password, $firstName, $lastName, $email, $cityName);

    // filling session with that user info to sign in directly after sign up submission
    //$_SESSION['idUser'] = $user['idUser'];
    $_SESSION['username'] = $username;
    $_SESSION['image'] = $user['image'];
    $_SESSION['lastLoginDate'] = $user['lastLoginDate'];
    $_SESSION['registerDate'] = $user['registerDate'];
} catch(PDOException $e) {
    var_dump('PDOException');
    echo $e->getMessage();

    if (strpos($e->getMessage(), 'users_pkey') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate username';
        $_SESSION['field_errors']['username'] = 'Username already exists';
    } else {
        var_dump($e->getTraceAsString());
        $_SESSION['error_messages'][] = 'Error creating user';
    }

    $_SESSION['form_values'] = $_POST;
    header("Location: index.php?page=signUp");
    exit;
}

$_SESSION['success_messages'][] = 'User registered successfully';

go('../../pages/menus/explore.php');

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
