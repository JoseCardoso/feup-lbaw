<?php

use Facebook\FacebookSession;

/*Facebook App Details*/
define('FB_APP_ID', '871827579529786');
define('FB_APP_SECRET', '7365f13846e77ef47200509da3679518');
define('FB_REDIRECT_URI', 'http://gnomo.fe.up.pt/~lbaw1424/final/pages/authentication/sign-in-fb.php');

FacebookSession::setDefaultApplication(FB_APP_ID, FB_APP_SECRET);