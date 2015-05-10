<?php

include_once('../../config/config.php');

include ($BASE_DB . 'questions.php');

getQuestion();

$smarty->display($BASE_TEMPLATES . 'questions/question.tpl');