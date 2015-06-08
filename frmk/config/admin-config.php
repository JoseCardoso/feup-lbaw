<?php

require_once('../../database/admin.php');

if (isset($_SESSION['adminid']))
{
    $admin = Admin::find($_SESSION['adminid']);
    if (!$admin)
        go('../../index.php');

    $_SESSION['adminUsername'] = $admin->username;
} else
{
    go('../../index.php');
}