<?php

include_once('../../config/config.php');

include ($BASE_DB . 'user.php');
include ($BASE_DB . 'question.php');

try {
    $profile = User::find($_SESSION['iduser']);
    $questions = Question::userQuestions($_SESSION['username']);

} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

verifySessionVariables();

$smarty->assign('fb_logged', $_SESSION['fb_logged']);
$smarty->assign('username', $_SESSION['username']);

assignFacebookSmallPictureToSmarty($smarty);
assignFacebookLargePictureToSmarty($smarty);

$smarty->assign('profile', $profile);
$smarty->assign('questions', $questions);

$smarty->assign('JS_PATH', $JS_PATH);
$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'users/profile.tpl');
