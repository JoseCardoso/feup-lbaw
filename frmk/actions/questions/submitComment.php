<?php

include_once('../../config/config.php');

include($BASE_DB . 'comment.php');

if(isset($_POST) && isset($_POST['comment']) && $_POST['comment'] != '' && isset($_POST['contributon_id'])) {
    $comment = Comment::createComment($_POST['contribution'], $_POST['comment']);

    echo json_encode($comment);

} else {
    echo json_encode(array());
}
