<?php

include_once('../../config/config.php');

include ($BASE_DB . 'users.php');
include ($BASE_DB . 'questions.php');

try {
    $profile = getProfile();
    //$questions = getQuestionsUser();
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

verifySessionVariables();

$smarty->assign('profile', $profile);

$smarty->display($BASE_TEMPLATES . 'users/profile.tpl');
