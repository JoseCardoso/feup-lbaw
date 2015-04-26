<?php

function createUser($username, $password, $firstName, $lastName, $email, $cityName) {
	var_dump('creating user');
	
	global $connection;
	$stmt = $connection->prepare("INSERT INTO askfeup.utilizador VALUES (?, ?, ?)");
	$stmt->execute(array('default', $username, $password));
	var_dump('test2');

	var_dump('test1');

	$idUserQuery = $connection->prepare(" SELECT currval(pg_get_serial_sequence('utilizadores','utilizadorid'));");
	$idUser = $idUserQuery->fetchAll();

	$idCityQuery = $connection->prepare("SELECT cidadeid FROM cidade WHERE nome = ?");
	$idCity = $idCityQuery->fetchAll();

	var_dump($idCity);

	createMember($connection, $firstName, $lastName, $email, $idUser, $idCity);
}

function createMember($conn, $firstName, $lastName, $email, $idUser, $idCity) {
	$stmt = $conn->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
	$stmt->execute(array('true', $firstName, $lastName, $email, 0, 'current_timestamp', 'current_timestamp'), $idUser, $idCity);
}

function isLoginCorrect($username, $password) {
	global $connection;
	$stmt = $connection->prepare("SELECT *
		FROM utilizadores
		WHERE username = ? AND password = ?");
	$stmt->execute(array($username, sha1($password)));
	return $stmt->fetch() == true;
}
