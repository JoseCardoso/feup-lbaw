<?php

include_once('../../config/config.php');

include ($BASE_DB . '/authentication.php');

if (!$_POST['password'] || !$_POST['code']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    go('../../pages/authentication/recover-password.php');
}

$password = $_POST['password'];
$code = $_POST['code'];

try {
    if (changePassword($code, $password)) {
        go('../../pages/authentication/sign-in.php');
    }
    else
        var_dump('Failed');

} catch (PDOException $e) {

}