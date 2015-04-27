<?php

include $BASE_DB . '/authentication.php';
require $BASE_CONFIG . '/phpmailer/class.phpmailer.php';

if (!$_POST['email']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    header("Location: index.php?page=passwordRecovery");
    exit;
}

$email = strip_tags($_POST['email']);

try {
    if (sentValidationCode($BASE_URL, $email))
        var_dump('Email has been sent');
    else
        var_dump('Failed');

} catch (PDOException $e) {

}