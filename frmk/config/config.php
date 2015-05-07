<?php

include_once('paths-init.php');
include_once('init.php');
include_once('phpmailer.php');

function go($destination) {
    header('Location: ' . $destination);
    exit();
}

function verifySessionVariables() {
    // session username
    global $smarty;
    if(isset($_SESSION['username']))
        $username = $_SESSION['username'];
    else
        $username = null;

    $smarty->assign('username', $username);
}