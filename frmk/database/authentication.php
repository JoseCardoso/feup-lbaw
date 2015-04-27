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

	return $stmt->fetch() == true;
}

function sentValidationCode($BASE_URL, $email) {
    global $connection;
    $stmt = $connection->prepare("SELECT membroid FROM membro WHERE email = ?");
    $stmt->execute(array($email));
    $idMember = $stmt->fetch()['membroid'];

    var_dump("Aqui");
    var_dump($email);

    if(!isset($idMember))
        return false;
    else {
        $code = rand(0, 10) . uniqid() . rand(0, 10);
        $timestamp = date('Y-m-d G:i:s');
        var_dump('Codigo: ' . $code);

        $subject = "Recuperação de password - AskFEUP";
        $message = "Para repor a sua password por favor clique no link abaixo.\r\n" . $BASE_URL . "/index.php?page=recoverPassword&id=" . $code;


        /***********/
        global $error;
        $mail = new PHPMailer;

        $mail->IsSMTP();                                      // Set mailer to use SMTP
        $mail->SMTPDebug = 0;                                 // debugging: 1 = errors and messages, 2 = messages only
        $mail->SMTPAuth = true;                               // authentication enabled
        $mail->SMTPSecure = 'tls';                            // secure transfer enabled REQUIRED for GMail
        $mail->Host = 'smtp.gmail.com';                       // Specify main and backup server
        $mail->Port = 587;
        $mail->Username = 'pereiraffjoao1993@gmail.com';      // SMTP username
        $mail->Password = '2Jo25ao1993FPereira';              // SMTP password
        $mail->SetFrom('pereiraffjoao1993@gmail.com', 'Joao Pereira');
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
        var_dump($error);
        /************/

        $stmt = $connection->prepare("INSERT INTO recuracaodepassword VALUES (?, ?, ?)");
        $stmt->execute(array($code, $timestamp, $idMember));
        return true;
    }
}
