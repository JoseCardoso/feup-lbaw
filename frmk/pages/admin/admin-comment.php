<?php

include_once('../../config/config.php');

include($BASE_DB . 'comment.php');

if (isset($_GET['comment'])) {
    try {
        $comment = Comment::find($_GET['comment']);

        $smarty->assign('comment', $comment);
        $smarty->assign('BASE_URL', $BASE_URL);

        $smarty->display($BASE_TEMPLATES . 'admin/admin-comment.tpl');

    } catch (Exception $e) {
        echo $e->getMessage();
    }
} else
    go('../../pages/admin/admin-comments.php');