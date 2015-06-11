<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');

if (isset($_POST) && isset($_POST['id']) && $_POST['id'] != '' &&
    isset($_POST) && isset($_POST['user_session']) && $_POST['user_session'] != ''
) {
    try {
        $isFavourite = Question::checkIfQuestionIsFavourite($_POST['id'], $_SESSION['iduser']);
        if (empty($isFavourite)) {
            // is not favorite so add one
            Question::insertFavoriteQuestion($_POST['id'], $_SESSION['iduser']);

            echo json_encode(array('state' => "insert", 'new_favourite' => $_POST['id']));

        } else {
            // is not favorite so add one
            Question::removeFavoriteQuestion($_POST['id'], $_SESSION['iduser']);

            echo json_encode(array('state' => "remove", 'last_favourite' => $_POST['id']));
        }
        //echo json_encode($isFavourite);
    } catch (Exception $ex) {
        echo json_encode($ex->getMessage());
    }
} else {
    echo json_encode(array('error' => 'Fields are missing'));
}