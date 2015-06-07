<?php

include_once('../../config/config.php');

$smarty->assign('BASE_URL', $BASE_URL);

$smarty->display($BASE_TEMPLATES . 'admin/admin-home.tpl');