<?php

include_once('../../config/config.php');

include ($BASE_DB . '/authentication.php');

if (!$_POST['email']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    go('../../pages/authentication/request-password-recovery.php');
}

$email = strip_tags($_POST['email']);

try {
    $URL = "http://" . $_SERVER['SERVER_NAME'];
    if (sentValidationCode($URL, $email)) {
        go('../../pages/authentication/sign-in.php');
    }
    else
        var_dump('Failed');

} catch (PDOException $e) {

}