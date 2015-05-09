<?php
  include_once('../../config/init.php');

  $count = getTweetCountAfter($_GET['id']);  
  
  echo json_encode($count);
?>
