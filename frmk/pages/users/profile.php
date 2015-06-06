<?php

include_once('../../config/config.php');

include($BASE_DB . 'user.php');
include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

try {
    if (isset($_GET['username'])) {
        if ($_GET['username'] !== $_SESSION['username'])
            $profile = User::find_by_user($_GET['username']);
        else
            $profile = User::find($_SESSION['iduser']);
    } else
        $profile = User::find($_SESSION['iduser']);

    // load user own questions
    $user_questions = Question::userQuestions($profile->username);

    // get ids from the questions that user answered
    $answered_questions_id = Answer::getQuestionsFromUserAnswers($profile->username);
    // load user answered questions
    if (isset($answered_questions_id))
        $user_questions_answered = Question::userAnsweredQuestions($answered_questions_id);

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
