<?php

include_once('../../config/config.php');
include_once('../../config/admin-config.php');
include($BASE_DB . 'answer.php');

try {
    if (isset($_GET['answer']))
        Answer::delete($_GET['answer']);
} catch (Exception $e) {
    $e->getMessage();
}

go('../../pages/admin/admin-answers.php');