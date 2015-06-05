<?php

include_once('../../config/config.php');

include($BASE_DB . 'city.php');

$smarty->assign('BASE_ACTIONS', $BASE_ACTIONS);

try {
    $cities = City::all('SELECT cidade.nome FROM askfeup.cidade GROUP BY cidade.nome ORDER BY cidade.nome');
} catch (PDOException $e) {
	echo $e->getMessage();
    die();
}

$smarty->assign('cities', $cities);

$smarty->display($BASE_TEMPLATES . 'authentication/sign-up.tpl');
