<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

try {
// question and question comments
    $question = Question::find($_POST['id']);
    $question_comments = $question->loadComments();
    $question->comments = $question_comments;

// check if question is one of favourites of the user in session
    if ($question->check_if_question_is_favourite($_SESSION['iduser']))
        $question->favourite = true;
    else
        $question->favourite = false;

// check if vote is positive, negative or null for the question
    if ($vote = $question->get_vote_value($_SESSION['iduser']))
        if ($vote['positivo'] == true)
            $question->vote = true;
        else
            $question->vote = false;
    else
        $question->vote = null;

// answers to the question and all comments to the answers
    $answers = Answer::all("SELECT * FROM answers_presentation WHERE answers_presentation.perguntaid = ?;", array($question->id));
    if (!empty($answers))
        $answers_comments = Answer::loadComments($answers);

// group comments in respective answer
    foreach ($answers as $answer) {
        // check if vote is positive, negative or null for the answer
        if ($vote = $answer->get_vote_value($_SESSION['iduser']))
            if ($vote['positivo'] == true)
                $answer->vote = true;
            else
                $answer->vote = false;
        else
            $answer->vote = null;

        $comments = array();
        foreach ($answers_comments as $comment) {
            if ($answer->id == $comment->contribution_id)
                $comments[] = $comment;
        }
        $answer->comments = $comments;
    }

// constructing data with all info
    $data = array('question' => $question, 'answers' => $answers, 'user_session' => $_SESSION['username']);
} catch (Exception $e) {
    $data = $e->getMessage();
}
// return data in format json
echo json_encode($data);
