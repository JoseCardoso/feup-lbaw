<?php

include_once('../../config/config.php');

/*use Facebook\FacebookRedirectLoginHelper;

$helper = new FacebookRedirectLoginHelper(FB_REDIRECT_URI);
$loginUrl = $helper->getLoginUrl(['email']);*/

$smarty->assign('loginUrl', $loginUrl);
$smarty->assign('currentPage', basename($_SERVER['PHP_SELF']));

$smarty->display($BASE_TEMPLATES . 'authentication/sign-in.tpl');
