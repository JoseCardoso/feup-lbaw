<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

if (isset($_POST) && isset($_POST['id']) && $_POST['id'] != '' &&
    isset($_POST['value']) && isset($_POST['type']) &&
    isset($_POST['user_session']) && $_POST['user_session'] != '') {
    try {
        $contribution = null;

        if ($_POST['type'] == 'question')
            $contribution = Question::find($_POST['id']);
        else if ($_POST['type'] == 'answer')
            $contribution = Answer::find($_POST['id']);
        else
            throw new Exception("Contribution does not exists");

        list($previous, $vote) = $contribution->processVote($_POST['value']);

        echo json_encode(array('previous' => $previous, 'value' => $vote));

    } catch (Exception $ex) {
        echo json_encode($ex->getMessage());
        //echo json_encode(array('value' => 0));
    }
} else {
    echo json_encode(array('value' => 0));
}