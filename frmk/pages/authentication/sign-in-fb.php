<?php

include_once('../../config/config.php');

include($BASE_DB . '/user.php');

use Facebook\FacebookRedirectLoginHelper;
use Facebook\FacebookRequest;

if(isset($_GET['error']) && $_GET['error'] == 'access_denied') {
    if(isset($_GET['error_code']) && $_GET['error_code'] == '200') {
        $error = 'Permission error';
        $error_reason = 'You have cancel your login with Facebook.';

        $smarty->assign('error', $error);
        $smarty->assign('error_reason', $error_reason);

        $smarty->display($BASE_TEMPLATES . 'errors/error-sign-in.tpl');
        exit();
    }
}

$helper = new FacebookRedirectLoginHelper(FB_REDIRECT_URI);

try {
    $session = $helper->getSessionFromRedirect();

} catch (FacebookRequestException $ex) {
    echo 'ERROR 1';
    echo '<br>';
    echo $ex->getMessage();

} catch (\Exception $ex) {
    echo 'ERROR 2';
    echo '<br>';
    echo $ex->getMessage();

}

if (isset($session) && $session) {
    $_SESSION['fb-session'] = $session->getToken();
}

list($logged, $user) = User::fb_login();

try {
    if (!$logged) {
        $_SESSION['error_messages'][] = 'Invalid username or password';
        $_SESSION['form_values'] = $_POST;

        go($_SERVER['HTTP_REFERER']);
    }

    $_SESSION['iduser'] = $user->id;
    $_SESSION['username'] = $user->firstName . ' ' . $user->lastName;
    $_SESSION['email'] = $user->email;
    $_SESSION['fb_logged'] = true;

} catch (Exception $e) {
    die($e->getMessage());
}

try {
    $request = (new FacebookRequest($session, 'GET', '/me/picture?redirect=false'))->execute();
    $smallPicture = $request->getGraphObject();

    $request = (new FacebookRequest($session, 'GET', '/me/picture?type=large&redirect=false'))->execute();
    $largePicture = $request->getGraphObject();

    $_SESSION['fb-picture-small'] = $smallPicture->getProperty('url');
    $_SESSION['fb-picture-large'] = $largePicture->getProperty('url');

} catch(FacebookRequestException $ex) {
    echo $ex->getMessage();
}

go('../../pages/users/profile.php');

