<?php

include_once('../../config/config.php');
include($BASE_DB . 'question.php');

try {
    $questions = Question::all(null);
} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('questions', $questions);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-questions.tpl');