<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');

if (isset($_GET['question'])) {
    try {
        $question = Question::find($_GET['question']);

        $smarty->assign('question', $question);
        $smarty->assign('BASE_URL', $BASE_URL);

        $smarty->display($BASE_TEMPLATES . 'admin/admin-question.tpl');

    } catch (Exception $e) {
        echo $e->getMessage();
    }
} else
    go('../../pages/admin/admin-questions.php');
