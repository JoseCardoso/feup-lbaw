<?php

include_once('../../config/config.php');

include ($BASE_DB . 'users.php');
include ($BASE_DB . 'questions.php');

include ($BASE_DB . 'user.php');
include ($BASE_DB . 'question.php');


try {
    //$profile = getProfile();
    $profile = User::find($_SESSION['idUser']);
    // $questions = getQuestionsUser();
    $questions = Question::userQuestions($_SESSION['idUser']);
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}


verifySessionVariables();

$smarty->assign('profile', $profile);
$smarty->assign('questions', $questions);

$smarty->assign('JS_PATH', $JS_PATH);
$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'users/profile.tpl');
