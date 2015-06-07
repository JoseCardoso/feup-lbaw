<?php

include_once('../../config/config.php');
include($BASE_DB . 'user.php');

try {
    $users = User::all(null, null);
} catch (Exception $e) {
    $e->getMessage();
}

$smarty->assign('users', $users);

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-users.tpl');