<?php

function sentValidationCode($URL, $email)
{
    // get user's id by email
    $idMember = getUserByEmail($email);

    // check if user already has a request
    if (checkIfAlreadyExistsPasswordRequest($idMember)) {
        var_dump('You already request a password recovery at least one hour ago. Please check your email.');
        return false;
    }

    if (!isset($idMember))
        return false;
    else {
        $code = rand(0, 10) . uniqid() . rand(0, 10);

        $subject = "Recuperação de password - AskFEUP";
        $message = "Para repor a sua password por favor clique no link abaixo.\r\n";
        $message = $message . $URL . "/pages/authentication/recover-password.php?id=" . $code;

        sentEmail($subject, $message, $email);

        if (insertPasswordRequestOnDB($code, $idMember))
            return true;
        else
            return false;
    }
}

function changePassword($code, $password)
{
    global $connection;
    $stmt = $connection->prepare("UPDATE utilizador SET password=? WHERE utilizadorid=
        (SELECT membroid FROM recuperacaodepassword WHERE codigovalidacao=?)");

    $success = $stmt->execute(array(hash('sha256', $password), $code));

    return $success && removePasswordRequestFromDB($code);
}

function removePasswordRequestFromDB($code)
{
    global $connection;
    $stmt = $connection->prepare("DELETE FROM recuperacaodepassword WHERE codigovalidacao=?");
    return $stmt->execute(array($code));
}

function insertPasswordRequestOnDB($code, $idMember)
{
    global $connection;
    $stmt = $connection->prepare("INSERT INTO recuperacaodepassword(codigovalidacao, membroid) VALUES (?, ?)");
    return $stmt->execute(array($code, $idMember));
}

function sentEmail($subject, $message, $email)
{
    global $error;
    global $mail;
    $mail->SetFrom('askfeup@gmail.com', 'AskFEUP');
    $mail->Subject = $subject;
    $mail->Body = $message;
    $mail->AddAddress($email);

    if (!$mail->Send()) {
        $error = 'Mail error: ' . $mail->ErrorInfo;
        var_dump($error);
    } else {
        $error = 'Message sent!';
    }
}

function getUserByEmail($email)
{
    global $connection;
    $stmt = $connection->prepare("SELECT membroid FROM membro WHERE email = ?");
    $stmt->execute(array($email));
    return $stmt->fetch()['membroid'];
}

function checkIfAlreadyExistsPasswordRequest($idMember)
{
    global $connection;
    $stmt = $connection->prepare("SELECT recuperacaodepasswordid, data FROM recuperacaodepassword WHERE membroid = $idMember");
    $stmt->execute();
    $idPasswordRecovery = $stmt->fetch()['recuperacaodepasswordid'];

    //$requestDate = strtotime($stmt->fetch()['data']);
    //$now = time();
    //var_dump('RequestDate: ' . $requestDate);
    //var_dump('CurrentDate: ' . $now);

    // process time since last request has been sent
    $diff = (time() - strtotime($stmt->fetch()['data'])) / 3600;

    //var_dump('DifferenceDates: ' . (($now - $requestDate) / 3600));

    /* if request exists or was processed at least an hour then failed */
    if ($idPasswordRecovery != NULL && $diff < 1) {
        return true;
    } else if ($idPasswordRecovery != NULL && $diff >= 1) {
        removePasswordRequestFromDB($idPasswordRecovery);
        return false;
    } else
        return false;
}