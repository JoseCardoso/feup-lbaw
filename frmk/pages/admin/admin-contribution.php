<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

if (isset($_GET['contribution_id'])) {
    if ($question = Question::find($_GET['contribution_id'])) {

        var_dump($question);

    } else if ($answer = Answer::find($_GET['contribution_id'])) {

        var_dump($answer);
    } else {

        go('../../pages/admin/admin-home.php');
    }

} else {
    go('../../pages/admin/admin-home.php');
}