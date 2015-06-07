<?php

include_once('../../config/config.php');

include_once($BASE_DB . 'question.php');

try {
    $mode = $_GET['tab'];
    if (isset($mode)) {

        switch($mode)  {
            case 'recent':
                $query = 'SELECT * FROM questions_presentation ORDER BY data DESC;';
                break;

            case 'popular':
                $query = 'SELECT * FROM questions_presentation ORDER BY votos DESC;';
                break;

            case 'viewed':
                $query = 'SELECT * FROM questions_presentation ORDER BY visualizacoes DESC;';
                break;

            default:
                break;
        }

        $questions = Question::all($query);

    } else {
        $questions = Question::all(null);
    }

} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}

verifySessionVariables();

assignFacebookSmallPictureToSmarty($smarty);

$smarty->assign('questions', $questions);
$smarty->assign('currentPage', basename($_SERVER['PHP_SELF']));

$smarty->assign('JS_PATH', $JS_PATH);
$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'menus/explore.tpl');
