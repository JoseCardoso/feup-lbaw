<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'answer.php');
/*include($BASE_DB . 'comment.php');*/

try {
    /* Get values from hidden url */
    $search = strip_tags($_POST['search']);

    /* Check if search filed is empty or do not exist */
    if (empty($search) || $search === '')
        throw new Exception('search_missing');

    $all_question = Question::search(null);

    var_dump($all_question);
    exit();

} catch (Exception $e) {
    if (strcmp($e->getMessage(), 'search_missing') === 0)
        go($_SERVER['HTTP_REFERER']);

    else {
        $e->getMessage();
    }

    $_SESSION['form_values'] = $_POST;
}