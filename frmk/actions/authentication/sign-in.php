<?php

include_once('../../config/config.php');

include ($BASE_DB . '/authentication.php');

try {
	$username = strip_tags($_POST['username']);
	$password = $_POST['password'];

	if (!$username && !$password) {
		$_SESSION['error_messages'][] = 'All fields are mandatory';
		$_SESSION['form_values'] = $_POST;

		header("Location: " . $_SERVER['HTTP_REFERER']);
		exit;
	}

    list($logged, $idUser) = correctLogin($username, $password);

	if(!$logged) {
		$_SESSION['error_messages'][] = 'Invalid username or password';
		$_SESSION['form_values'] = $_POST;

		header("Location: " . $_SERVER['HTTP_REFERER']);
		exit;
	}

	$_SESSION['idUser'] = $idUser;
    $_SESSION['username'] = $username;

} catch (PDOException $e) {
	die($e->getMessage());
}

go('../../pages/users/profile.php');