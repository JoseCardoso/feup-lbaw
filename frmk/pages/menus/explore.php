<?php

include_once('../../config/config.php');

include ($BASE_DB . 'question.php');

try {
    $questions = Question::all();

} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

verifySessionVariables();

$smarty->assign('questions', $questions);

$smarty->display($BASE_TEMPLATES . 'menus/explore.tpl');
