<?php

include_once('../../config/config.php');

include ($BASE_DB . '/user.php');

try {
	$username = strip_tags($_POST['username']);
	$password = $_POST['password'];

	if (!$username && !$password) {
		$_SESSION['error_messages'][] = 'All fields are mandatory';
		$_SESSION['form_values'] = $_POST;

        go($_SERVER['HTTP_REFERER']);
	}

    list($logged, $user) = User::login($username, $password);

	if(!$logged) {
		$_SESSION['error_messages'][] = 'Invalid username or password';
		$_SESSION['form_values'] = $_POST;

        go($_SERVER['HTTP_REFERER']);
	}

	$_SESSION['iduser'] = $user->id;
    $_SESSION['username'] = $user->username;
    $_SESSION['email'] = $user->email;

} catch (Exception $e) {
	die($e->getMessage());
}

go('../../pages/users/profile.php');