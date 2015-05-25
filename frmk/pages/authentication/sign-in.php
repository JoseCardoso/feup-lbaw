<?php

include_once('../../config/config.php');

/*use Facebook\FacebookRedirectLoginHelper;

$helper = new FacebookRedirectLoginHelper(FB_REDIRECT_URI);
$loginUrl = $helper->getLoginUrl(['email']);*/

$smarty->assign('loginUrl', $loginUrl);

$smarty->display($BASE_TEMPLATES . 'authentication/sign-in.tpl');
