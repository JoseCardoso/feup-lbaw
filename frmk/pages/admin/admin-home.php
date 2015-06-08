<?php

include_once('../../config/config.php');
require_once('../../config/admin-config.php');

$smarty->assign('BASE_URL', $BASE_URL);
$smarty->assign('username', $_SESSION['adminUsername']);

$smarty->display($BASE_TEMPLATES . 'admin/admin-home.tpl');