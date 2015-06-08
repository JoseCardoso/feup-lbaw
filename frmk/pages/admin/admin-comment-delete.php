<?php

include_once('../../config/config.php');
include_once('../../config/admin-config.php');
include($BASE_DB . 'comment.php');

try {
    if (isset($_GET['comment']))
        Comment::delete($_GET['comment']);
} catch (Exception $e) {
    $e->getMessage();
}

go('../../pages/admin/admin-comments.php');