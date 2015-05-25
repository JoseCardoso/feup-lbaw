<?php

include_once('../../config/config.php');

include ($BASE_DB . 'questions.php');

assignFacebookSmallPictureToSmarty($smarty);

$smarty->display($BASE_TEMPLATES . 'questions/create-question.tpl');