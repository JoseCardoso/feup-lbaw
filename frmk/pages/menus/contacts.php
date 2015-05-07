<?php

include_once('../../config/config.php');

verifySessionVariables();

$smarty->display($BASE_TEMPLATES . 'menus/contacts.tpl');
