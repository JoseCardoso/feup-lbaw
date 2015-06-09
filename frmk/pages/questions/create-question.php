<?php

include_once('../../config/config.php');

include($BASE_DB . 'question.php');
include($BASE_DB . 'category.php');

$categories = Category::all(null);

assignFacebookSmallPictureToSmarty($smarty);

/*fields missing control*/
if (isset($_SESSION['field_errors']))
    $smarty->assign('field_missing', $_SESSION['field_errors']);

if (isset($_SESSION['form_values']))
    $smarty->assign('form_values', $_SESSION['form_values']);

$smarty->assign('username', $_SESSION['username']);
$smarty->assign('categories', $categories);
$smarty->assign('JS_PATH', $JS_PATH);

$smarty->display($BASE_TEMPLATES . 'questions/create-question.tpl');

unset($_SESSION['field_errors']);
unset($_SESSION['error_messages']);
unset($_SESSION['form_values']);
