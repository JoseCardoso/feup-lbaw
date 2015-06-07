<?php

include_once('../../config/config.php');

include($BASE_DB . 'comment.php');

try {

    if (isset($_GET['contribution_id']))
        $comments = Comment::all("SELECT comentario.*, username FROM comentario, utilizador WHERE contribuicaoid = ? AND utilizadorid = membroid ORDER BY data;", array($_GET['contribution_id']));
    else if (isset($_GET['user']))
        $comments = Comment::all("SELECT comentario.*, username FROM comentario, utilizador WHERE username = ? AND utilizadorid = membroid ORDER BY data;", array($_GET['user']));
    else
        $comments = Comment::all(null, null);

} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('comments', $comments);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-comments.tpl');
