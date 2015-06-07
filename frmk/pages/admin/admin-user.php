<?php

include_once('../../config/config.php');

include($BASE_DB . 'user.php');

if (isset($_GET['user'])) {
    try {
        $user = User::find_by_user($_GET['user']);

        $smarty->assign('user', $user);
        $smarty->assign('BASE_URL', $BASE_URL);

        $smarty->display($BASE_TEMPLATES . 'admin/admin-user.tpl');

    } catch (Exception $e) {
        echo $e->getMessage();
    }
} else
    go('../../pages/admin/admin-users.php');

