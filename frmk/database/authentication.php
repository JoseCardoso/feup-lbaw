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
        $code = rand(0, 10) . uniqid() . rand(0, 10);
        $timestamp = date('Y-m-d G:i:s');
        var_dump('Código: ' . $code);

        $to = $email;
        $subject = "Recuperação de password - AskFEUP"
        $message = "Para repor a sua password por favor clique no link abaixo.\r\n" . $BASE_URL . "/index.php?page=&code=" . $code;
        $headers = "From: askfeup@fe.up.pt" . phpversion();

        mail($to, $subject, $message, $headers);

        $stmt = $connection->prepare("INSERT INTO recuracaodepassword VALUES (?, ?, ?)");
        $stmt->execute(array($code, $timestamp, $idMember));
        return true;
    }
}