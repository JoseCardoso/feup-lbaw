<?php

include_once('../../config/config.php');
include($BASE_DB . 'question.php');

try {

    if (isset($_GET['user']))
        $questions = Question::all("SELECT * FROM questions_presentation WHERE questions_presentation.user = ? ORDER BY questions_presentation.data DESC;", array($_GET['user']));
    else
        $questions = Question::all(null, null);
} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('questions', $questions);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-questions.tpl');