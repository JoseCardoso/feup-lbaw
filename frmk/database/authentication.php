<?php

function createUser($username, $password, $firstName, $lastName, $email, $cityName) {
	global $connection;
	var_dump($connection);
	$stmt = $connection->prepare("INSERT INTO utilizador(username, password) VALUES (?, ?)");
	//$stmt->debugDumpParams();
	$stmt->execute(array($username, $password));

	$idUserQuery = $connection->prepare("SELECT utilizadorid FROM utilizador ORDER BY utilizadorid DESC LIMIT 1");
    $idUserQuery->execute();
	$idUser = $idUserQuery->fetch()['utilizadorid'];

    var_dump($connection);
    var_dump($cityName);

	$idCityQuery = $connection->prepare("SELECT cidadeid FROM cidade WHERE nome = ?");
    $idCityQuery->execute(array($cityName));
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
