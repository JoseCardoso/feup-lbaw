<?php

include_once('../../config/config.php');
include_once('../../config/admin-config.php');
include($BASE_DB . 'question.php');

try {
    if (isset($_GET['question']))
        Question::delete($_GET['question']);
} catch (Exception $e) {
    $e->getMessage();
}

go('../../pages/admin/admin-questions.php');