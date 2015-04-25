<?php

include_once('../../config/init.php');

$smarty->display($BASE_TEMPLATES . 'common/header.tpl');

$smarty->display($BASE_TEMPLATES . 'common/navbar.tpl');

$smarty->display($BASE_TEMPLATES . 'menus/faq.tpl');

$smarty->display($BASE_TEMPLATES . 'common/footer.tpl');