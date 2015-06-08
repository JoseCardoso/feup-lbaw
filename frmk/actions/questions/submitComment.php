<?php

include_once('../../config/config.php');

include($BASE_DB . 'comment.php');

if(isset($_POST) && isset($_POST['comment']) && $_POST['comment'] != '' && isset($_POST['contribution_id'])) {

    try {
        $comment = Comment::createComment($_POST['contribution_id'], $_POST['comment']);

        echo json_encode($comment);

    } catch(Exception $e) {
        var_dump($e->getMessage());
        json_encode(array());
    }
} else {
    echo json_encode("ERROR on comment post values.");
}
