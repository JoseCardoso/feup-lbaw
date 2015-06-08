<?php

include_once('../../config/config.php');
include_once('../../config/admin-config.php');
include($BASE_DB . 'user.php');

try {
    if (isset($_GET['user']))
        User::delete($_GET['user']);
} catch (Exception $e) {
    $e->getMessage();
}

go('../../pages/admin/admin-users.php');