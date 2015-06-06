<?php

include_once('../../config/config.php');

include ($BASE_DB . 'user.php');
include ($BASE_DB . 'question.php');
include ($BASE_DB . 'answer.php');

try {
    $profile = User::find($_SESSION['iduser']);
    $user_questions = Question::userQuestions($_SESSION['username']);

    $answers = Answer::getQuestionsFromUserAnswers($_SESSION['username']);

    if(isset($answers))
        $user_questions_answered = Question::userAnsweredQuestions($answers);

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
$smarty->assign('user_questions', $user_questions);
$smarty->assign('user_answered_questions', $user_questions_answered);

$smarty->assign('JS_PATH', $JS_PATH);
$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'users/profile.tpl');
