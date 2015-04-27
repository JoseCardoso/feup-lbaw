<?php

include $BASE_DB . '/authentication.php';

try {
	$username = strip_tags($_POST['username']);
	$password = $_POST['password'];

	if (!$username || !$password) {
		$_SESSION['error_messages'][] = 'All fields are mandatory';
		$_SESSION['form_values'] = $_POST;

		header("Location: index.php?page=signIn");
		exit;
	}

    list($logged, $userId) = correctLogin($username, $password);

	if(!$logged) {
		$_SESSION['error_messages'][] = 'Invalid username or password';
		$_SESSION['form_values'] = $_POST;

		header("Location: index.php?page=signIn");
		exit;
	}

	$_SESSION['user'] = $userId;
} catch (PDOException $e) {
	die($e->getMessage());
}

header("Location: index.php?page=profile");
exit;