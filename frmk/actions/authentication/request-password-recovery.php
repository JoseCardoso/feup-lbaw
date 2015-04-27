<?php

include $BASE_DB . '/authentication.php';

if (!$_POST['email']) {
    var_dump('Missing data!');

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;

    header("Location: index.php?page=requestPasswordRecovery");
    exit;
}

$email = strip_tags($_POST['email']);

try {
    if (sentValidationCode($BASE_URL, $email)) {

        header("Location: index.php?page=signIn");
    }
    else
        var_dump('Failed');

} catch (PDOException $e) {

}