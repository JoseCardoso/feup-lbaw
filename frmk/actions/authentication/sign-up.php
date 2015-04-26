<?php

include $BASE_DB . '/authentication.php';

if (!$_POST['username'] || !$_POST['password'] || !$_POST['firstName'] || !$_POST['lastName'] || !$_POST['email'] || !$_POST['cityName']) {
	var_dump('Missing data!');

	$_SESSION['error_messages'][] = 'All fields are mandatory';
	$_SESSION['form_values'] = $_POST;

	//header("Location: index.php?page=signUp");
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
	var_dump('create OK');
} catch (PDOException $e) {
	var_dump('PDOException');

	/*
	if (strpos($e->getMessage(), 'users_pkey') !== false) {
		$_SESSION['error_messages'][] = 'Duplicate username';
		$_SESSION['field_errors']['username'] = 'Username already exists';
	} else {
		$_SESSION['error_messages'][] = 'Error creating user';
	}

	$_SESSION['form_values'] = $_POST;
	header("Location: index.php?page=signUp");
	exit;
	*/
}

/*
$_SESSION['success_messages'][] = 'User registered successfully';
header("Location: $BASE_URL");
*/
