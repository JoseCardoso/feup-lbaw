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

function assignFacebookSmallPictureToSmarty($smarty) {
    // fb small picture
    if(isset($_SESSION['fb-picture-small']) && $_SESSION['fb-picture-small'])
        $smarty->assign('fb_picture_small', $_SESSION['fb-picture-small']);
}

function assignFacebookLargePictureToSmarty($smarty) {
    // fb large picture
    if(isset($_SESSION['fb-picture-large']) && $_SESSION['fb-picture-large'])
        $smarty->assign('fb_picture_large', $_SESSION['fb-picture-large']);
}