<?php
include $BASE_DB . 'users.php';
include $BASE_DB . 'questions.php';

$smarty->assign('BASE_ACTIONS', $BASE_ACTIONS);

try {
    $profile = getProfile();
    // $questions = getQuestions();
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

$smarty->assign('profile', $profile);

$smarty->display($BASE_TEMPLATES . 'users/profile.tpl');
