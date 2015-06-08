<?php

include_once('../../config/config.php');

include($BASE_DB . 'answer.php');

if(isset($_POST) && isset($_POST['answer']) && $_POST['answer'] != '' && isset($_POST['question_id'])) {
    $answer = Answer::createAnswer($_POST['question_id'], $_POST['answer']);

    // check if vote is positive, negative or null for the answer
    if ($vote = $answer->get_vote_value($_SESSION['iduser']))
        if ($vote['positivo'] == true)
            $answer->vote = true;
        else
            $answer->vote = false;
    else
        $answer->vote = null;

    $answer->comments = array();

    echo json_encode($answer);

} else {
    echo json_encode(array());
}
