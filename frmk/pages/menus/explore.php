<?php

include_once('../../config/config.php');

include ($BASE_DB . 'questions.php');

try {
    $questions = getAllQuestions();
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

verifySessionVariables();

$smarty->assign('questions', $questions);

$smarty->display($BASE_TEMPLATES . 'menus/explore.tpl');
