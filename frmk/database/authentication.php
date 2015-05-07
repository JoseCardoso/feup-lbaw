<?php

function createUser($username, $password, $firstName, $lastName, $email, $cityName) {
	global $connection;
	$stmt = $connection->prepare("INSERT INTO utilizador(username, password) VALUES (?, ?)");
	//$stmt->debugDumpParams();
	$stmt->execute(array($username, hash('sha256', $password)));

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

function correctLogin($username, $password) {
	global $connection;
	$stmt = $connection->prepare("SELECT utilizadorid FROM utilizador WHERE username = ? AND password = ?");
	$stmt->execute(array($username, hash('sha256', $password)));
    $fetch = $stmt->fetch(PDO::FETCH_ASSOC);

    if($fetch)
	    return array(true, $fetch['utilizadorid']);
    else
        return array(false, 0);
}

function sentValidationCode($BASE_URL, $email) {
    global $connection;
    $stmt = $connection->prepare("SELECT membroid FROM membro WHERE email = ?");
    $stmt->execute(array($email));
    $idMember = $stmt->fetch()['membroid'];

    /* check if user already has a request */
    $stmt = $connection->prepare("SELECT recuperacaodepasswordid, data FROM recuperacaodepassword WHERE membroid = $idMember");
    $stmt->execute();
    $idRecovery = $stmt->fetch()['recuperacaodepasswordid'];

    //$requestDate = strtotime($stmt->fetch()['data']);
    //$now = time();
    //var_dump('RequestDate: ' . $requestDate);
    //var_dump('CurrentDate: ' . $now);

    $diff = (time() - strtotime($stmt->fetch()['data'])) / 3600;

    //var_dump('DifferenceDates: ' . (($now - $requestDate) / 3600));

    /* if request exists or was processed at least an hour then failed */
    if($idRecovery != NULL && $diff < 1) {
        return false;
    }

    if(!isset($idMember))
        return false;
    else {
        $code = rand(0, 10) . uniqid() . rand(0, 10);

        $subject = "Recuperação de password - AskFEUP";
        $message = "Para repor a sua password por favor clique no link abaixo.\r\n" . $BASE_URL . "/pages/authentication/recover-password.php&id=" . $code;


        /******Sent email to user******/
        global $error; global $mail;
        $mail->SetFrom('askfeup@gmail.com', 'AskFEUP');
        $mail->Subject = $subject;
        $mail->Body = $message;
        $mail->AddAddress($email);

        if(!$mail->Send()) {
            $error = 'Mail error: '.$mail->ErrorInfo;
            var_dump($error);
            return false;
        } else {
            $error = 'Message sent!';
        }
        /******End of code******/

        $stmt = $connection->prepare("INSERT INTO recuperacaodepassword(codigovalidacao, membroid) VALUES (?, ?)");
        $stmt->execute(array($code, $idMember));

        return true;
    }
}

function changePassword($code, $password) {
    global $connection;
    $stmt = $connection->prepare("UPDATE utilizador SET password=? WHERE utilizadorid=
        (SELECT membroid FROM recuperacaodepassword WHERE codigovalidacao=?)");

    $success = $stmt->execute(array(hash('sha256', $password), $code));

    $stmt = $connection->prepare("DELETE FROM recuperacaodepassword WHERE codigovalidacao=?");
    return $success && $stmt->execute(array($code));
}
