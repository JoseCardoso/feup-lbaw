<?php

include_once('../../config/config.php');

verifySessionVariables();

assignFacebookSmallPictureToSmarty($smarty);

$smarty->display($BASE_TEMPLATES . 'menus/faq.tpl');
