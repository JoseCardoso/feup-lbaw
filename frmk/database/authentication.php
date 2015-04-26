<?php

function createUser($username, $password, $firstName, $lastName, $email, $cityName) {
	global $connection;
	$stmt = $connection->prepare("INSERT INTO utilizador(username, password) VALUES (?, ?)");
	//$stmt->debugDumpParams();
	$stmt->execute(array($username, $password));

	$idUserQuery = $connection->prepare("SELECT utilizadorid FROM utilizador ORDER BY utilizadorid DESC LIMIT 1");
    $idUserQuery->execute();
	$idUser = $idUserQuery->fetch()['utilizadorid'];

	$idCityQuery = $connection->prepare("SELECT cidadeid FROM cidade WHERE nome = ?");
    $idCityQuery->execute(array($cityName));
	$idCity = $idCityQuery->fetch()['cidadeid'];

    var_dump('ID do Utilizador: ' . $idUser);
    var_dump('ID do Cidade: ' . $idCity);

	createMember($firstName, $lastName, $email, $idUser, $idCity);
}

function createMember($firstName, $lastName, $email, $idUser, $idCity) {
    global $connection;
    $stmt = $connection->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $timestamp = date('Y-m-d G:i:s');
    $stmt->execute(array(1, $firstName, $lastName, $email, NULL, $timestamp, $timestamp, $idUser, $idCity));

}

function isLoginCorrect($username, $password) {
/*	global $connection;
	$stmt = $connection->prepare("SELECT username, password FROM utilizador	WHERE username = ? AND password = ?",$username, $password);
	$stmt->execute(array($username, sha1($password)));
	*/
	$penis = new PDO('pgsql:host=vdbm.fe.up.pt;dbname=lbaw1424', 'lbaw1424', 'gF576kv0');
$penis->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$penis->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$penis->exec('SET SCHEMA \'askfeup\'');
	$stmt = $penis->prepare("SELECT username, password FROM utilizador	WHERE username = ? AND password = ?");
	$stmt->execute(array($username, sha1($password)));
	return $stmt->fetch() == true;
}
