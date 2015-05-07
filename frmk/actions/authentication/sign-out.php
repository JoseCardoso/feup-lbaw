<?php

include_once('../../config/config.php');

try {
    //remove session variables
    session_unset();
    //destroy session
    session_destroy();
} catch (PDOException $e) {
    die($e->getMessage());
}

go('../../pages/authentication/sign-in.php');
