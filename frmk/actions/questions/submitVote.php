<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');

if(isset($_POST) && isset($_POST['id']) && $_POST['id'] != '' && isset($_POST['value'])) {
    try{
        $question = Question::find($_POST['id']);
        $question->addVote($_POST['value']);

        $return = $_POST['value'];
        if($return == 0) $return = -1;

        echo json_encode(array('value' => $return));

    }catch(Exception $ex) {
        echo json_encode(array('value' => 0));
    }
} else {
    echo json_encode(array('value' => 0));
}
