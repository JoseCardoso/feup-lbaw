<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

$question = Question::find($_POST['id']);

$question_comments = $question->loadComments();

$question->comments = $question_comments;

$answers = Answer::all("SELECT * FROM answers_presentation WHERE answers_presentation.perguntaid = ?;", array($question->id));

$answers_comments = Answer::loadComments($answers);

foreach($answers as $answer) {
    $comments = array();
    foreach($answers_comments as $comment) {
        if($answer->id == $comment->contribution_id)
            $comments[] = $comment;
    }
    $answer->comments = $comments;
}

$data = array('question'=>$question, 'answers'=>$answers);

echo json_encode($data);

//$smarty->display($BASE_TEMPLATES . 'questions/question-old.tpl');