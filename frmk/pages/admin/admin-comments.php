<?php

include_once('../../config/config.php');

include($BASE_DB . 'comment.php');

try {

    if (isset($_GET['contribution_id']))
        $comments = Comment::all_comments_from_contributions(array($_GET['contribution_id']));
    else
        $comments = Comment::all(null, null);

} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('comments', $comments);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-comments.tpl');
