<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');

function check_if_question_exists($questions, $id)
{
    if (empty($questions))
        return false;

    foreach ($questions as $question) {
        if ($question->id === $id)
            continue;
        else
            return false;
    }

    return true;
}

try {
    /* Get values from hidden url */
    $search = strip_tags($_POST['search']);

    /* Check if search filed is empty or do not exist */
    if (empty($search) || $search === '')
        throw new Exception('search_missing');

    $search = explode(' ', $search);
    $new_search = '';

    foreach ($search as $word)
        $new_search .= ' & ' . $word . ':*';

    $new_search = substr($new_search, 3);

    $all_questions = Question::search($new_search);

    $all_answers = Answer::search($new_search);

    if (!empty($all_answers))
        foreach ($all_answers as $answer)
            if (!check_if_question_exists($all_questions, $answer->question_id))
                $all_questions[] = Question::find($answer->question_id);


} catch (Exception $e) {
    if (strcmp($e->getMessage(), 'search_missing') === 0)
        go($_SERVER['HTTP_REFERER']);

    else {
        $e->getMessage();
    }
}

$smarty->assign('BASE_URL', $BASE_URL);
$smarty->assign('JS_PATH', $JS_PATH);

$smarty->assign('username', $_SESSION['username']);
$smarty->assign('search_content', $_POST['search']);
$smarty->assign('questions', $all_questions);

$smarty->display($BASE_TEMPLATES . 'questions/search.tpl');

$_SESSION['form_values'] = $_POST;