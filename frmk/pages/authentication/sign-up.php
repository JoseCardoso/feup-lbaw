<?php

include $BASE_DB . 'loadCities.php';

$smarty->assign('BASE_ACTIONS', $BASE_ACTIONS);

try {
	$cities = loadCities();
} catch (PDOException $e) {
	echo $e->getMessage();
    die();
}

$smarty->assign('cities', $cities);

$smarty->display($BASE_TEMPLATES . 'authentication/sign-up.tpl');
