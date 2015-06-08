<?php

include_once('../../config/config.php');

include($BASE_DB . 'answer.php');

if (isset($_GET['answer'])) {
    try {
        $answer = Answer::find($_GET['answer']);

        $smarty->assign('answer', $answer);
        $smarty->assign('BASE_URL', $BASE_URL);

        $smarty->display($BASE_TEMPLATES . 'admin/admin-answer.tpl');

    } catch (Exception $e) {
        echo $e->getMessage();
    }
} else
    go('../../pages/admin/admin-answers.php');
