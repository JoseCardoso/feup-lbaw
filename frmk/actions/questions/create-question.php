<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'tag.php');

try {
    /* Get values from hidden url */
    $text = strip_tags($_POST['question']);
    $description = strip_tags($_POST['description']);
    $tags = strip_tags($_POST['tags']);
    $category = strip_tags($_POST['category']);

    /* Confirm data */
    // verifying text and category missing fields
    if (empty($text) && empty($category))
        throw new Exception('text and category');

    // verifying text missing fields
    if (empty($text))
        throw new Exception('text');

    // verifying category missing fields
    if (empty($category))
        throw new Exception('category');


    if (empty($description))
        $description = null;

    if (empty($tags))
        $tags = null;
    else
        $tags = explode(",", $tags);

    $question_id = Question::createQuestion($text, $description, $category);
    Tag::processTags($tags, $question_id);

} catch (Exception $e) {

    if (strcmp($e->getMessage(), 'text and category') === 0) {
        $_SESSION['field_errors']['question_text'] = 'Text field required';
        $_SESSION['field_errors']['question_category'] = 'Category selection required';
    } else if (strcmp($e->getMessage(), 'text') === 0)
        $_SESSION['field_errors']['question_text'] = 'Text field required';
    else if (strcmp($e->getMessage(), 'category') === 0)
        $_SESSION['field_errors']['question_category'] = 'Category selection required';

    $_SESSION['form_values'] = $_POST;
    go($_SERVER['HTTP_REFERER']);
}

$_SESSION['success_messages'][] = 'Question has been added successfully';

go('../../pages/menus/explore.php');