<?php

function createUser($username, $password, $firstName, $lastName, $email, $cityName) {
	global $connection;
	$stmt = $connection->prepare("INSERT INTO utilizador(username, password) VALUES (?, ?)");
	//$stmt->debugDumpParams();
	$stmt->execute(array($username, sha1($password)));

	$idUserQuery = $connection->prepare("SELECT utilizadorid FROM utilizador ORDER BY utilizadorid DESC LIMIT 1");
    $idUserQuery->execute();
	$idUser = $idUserQuery->fetch()['utilizadorid'];

	$idCityQuery = $connection->prepare("SELECT cidadeid FROM cidade WHERE nome = ?");
    $idCityQuery->execute(array($cityName));
	$idCity = $idCityQuery->fetch()['cidadeid'];

    //var_dump('ID do Utilizador: ' . $idUser);
    //var_dump('ID do Cidade: ' . $idCity);

	createMember($firstName, $lastName, $email, $idUser, $idCity);
}

function createMember($firstName, $lastName, $email, $idUser, $idCity) {
    global $connection;
    $stmt = $connection->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $timestamp = date('Y-m-d G:i:s');
    $stmt->execute(array(1, $firstName, $lastName, $email, NULL, $timestamp, $timestamp, $idUser, $idCity));
}

function isLoginCorrect($username, $password) {
	global $connection;
	$stmt = $connection->prepare("SELECT utilizadorid FROM utilizador WHERE username = ? AND password = ?");
	$stmt->execute(array($username, sha1($password)));

	return $stmt->fetch() == true;
}

function sentValidationCode($email) {
    global $connection;
    $stmt = $connection->prepare("SELECT membroid FROM membro WHERE email = ?");
    $stmt->execute(array($email));
    $idMember = $stmt->fetch()['membroid'];

    if(!isset($idMember))
        return false;
    else {
        $stmt = $connection->prepare("SELECT primeiroNome, ultimoNome FROM membro WHERE membroid = $idMember");
        $stmt->execute();
        $firstName = $stmt->fetch()['primeironome'];
        $lastName = $stmt->fetch()['ultimonome'];



        $message = "";
    }
}

function createRandomPassword() {

    $chars = "abcdefghijkmnopqrstuvwxyz023456789";
    srand((double)microtime()*1000000);
    $i = 0;
    $pass = '' ;

    while ($i <= 7) {
        $num = rand() % 33;
        $tmp = substr($chars, $num, 1);
        $pass = $pass . $tmp;
        $i++;
    }

    return $pass;
}
