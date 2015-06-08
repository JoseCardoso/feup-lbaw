<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

if (isset($_POST) && isset($_POST['id']) && $_POST['id'] != '' && isset($_POST['value']) && isset($_POST['type'])) {
    try {
        $contribution = null;

        if ($_POST['type'] == 'question')
            $contribution = Question::find($_POST['id']);
        else if ($_POST['type'] == 'answer')
            $contribution = Answer::find($_POST['id']);
        else
            throw new Exception("Contribution does not exists");

        $vote = $contribution->processVote($_POST['value']);
        /*$return = $_POST['value'];
        // it means that the value is negative
        if($return == 0)
            $return = -1;*/

        echo json_encode($vote);
        //echo json_encode(array('value' => $return));

    } catch (Exception $ex) {
        echo json_encode("ERRO 1: " . $ex->getMessage());
        //echo json_encode(array('value' => 0));
    }
} else {
    echo json_encode("ERRO 2: " . $ex->getMessage());
    //echo json_encode(array('value' => 0));
}