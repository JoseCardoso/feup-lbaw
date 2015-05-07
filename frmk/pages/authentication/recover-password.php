<?php

include_once('../../config/config.php');

$recoveryRequestId = isset($_GET['id']) ? $_GET['id'] : 'NULL::LOL';

$smarty->assign('recoveryRequestId', $recoveryRequestId);

$smarty->display($BASE_TEMPLATES . 'authentication/recover-password.tpl');
