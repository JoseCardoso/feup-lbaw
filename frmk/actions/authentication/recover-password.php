<?php

include $BASE_DB . '/authentication.php';

if (!$_POST['password'] || !$_POST['code']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    header("Location: index.php?page=recoverPassword");
    exit;
}

$password = $_POST['password'];
$code = $_POST['code'];

try {
    if (changePassword($code, $password)) {
        header("Location: index.php?page=signIn");
    }
    else
        var_dump('Failed');

} catch (PDOException $e) {

}