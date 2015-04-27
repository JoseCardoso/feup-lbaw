<?php

include $BASE_DB . '/authentication.php';

if (!$_POST['email']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    header("Location: index.php?page=passwordRecovery");
    exit;
}

$email = strip_tags($_POST['email']);

try {
    sentValidationCode($email);

} catch (PDOException $e) {

}