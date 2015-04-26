<?php

include $BASE_DB . 'loadCities.php';

try {
	$cities = loadCities();
} catch (PDOException $e) {
	echo $e->getMessage();
    die();
}

// var_dump($cities); exit();


$smarty->assign('cities', $cities);

$smarty->display($BASE_TEMPLATES . 'authentication/sign-up.tpl');
