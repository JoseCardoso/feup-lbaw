<?php

include_once('../../config/config.php');

include($BASE_DB . 'answer.php');

try {

    if (isset($_GET['question_id']))
        $answers = Answer::all("SELECT * FROM answers_presentation WHERE perguntaid = ? ORDER BY data DESC;", array($_GET['question_id']));
    else if (isset($_GET['user']))
        $answers = Answer::all('SELECT * FROM askfeup.answers_presentation WHERE answers_presentation.user = ? ORDER BY answers_presentation.data DESC', array($_GET['user']));
    else
        $answers = Answer::all("SELECT * FROM answers_presentation ORDER BY data DESC;", array());

} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('answers', $answers);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-answers.tpl');
