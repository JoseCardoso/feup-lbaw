<?php

include_once('../../config/config.php');

include($BASE_DB . 'answer.php');

if (isset($_POST) && isset($_POST['id']) && $_POST['id'] != '' &&
    isset($_POST['question_id']) && $_POST['question_id'] != '' &&
    isset($_POST['user_session']) && $_POST['user_session'] != ''
    && isset($_POST['question_owner']) && $_POST['question_owner'] != ''
) {
    if ($_POST['question_owner'] == $_POST['user_session']) {
        try {
            $correctAnswer = Answer::getCorrectAnswer($_POST['question_id']);

            if (empty($correctAnswer)) {
                // does not exist correct so add one
                Answer::insertCorrectAnswer($_POST['id']);

                echo json_encode(array('state' => 'insert', 'new_correct' => $_POST['id']));

            } else {
                if ($correctAnswer[0]->id == $_POST['id']) {
                    // remove correct
                    $correctAnswer[0]->removeCorrectAnswer();

                    echo json_encode(array('state' => 'remove', 'last_correct' => $_POST['id']));

                } else {
                    // remove correct from the old one and add correct to the new
                    $correctAnswer[0]->removeCorrectAnswer();

                    Answer::insertCorrectAnswer($_POST['id']);
                    echo json_encode(array('state' => 'update', 'last_correct' => $correctAnswer[0]->id, 'new_correct' => $_POST['id']));
                }
            }
        } catch (Exception $e) {
            echo json_encode($e->getMessage());
        }
    } else {
        echo json_encode(array('state' => 'permission', 'content' => 'User in the session have not permission to mark correct answer.'));
    }
} else {
    echo json_encode(array('error' => 'Fields are missing'));
}
