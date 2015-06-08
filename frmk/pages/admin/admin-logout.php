<?php
include_once('../../config/config.php');
require_once('../../config/admin-config.php');

$admin->logout();
go('../../index.php');