<?php

require_once('model.php');

if (isset($_GET['word'])) {

    echo ' tou a aqui';
    $text = $_GET['word'];
    global $connection;
    try {
        $stmt = $connection->prepare("SELECT * FROM pergunta WHERE username %= ?");
        $stmt->execute(array($text));
        return $stmt->fetch();

    } catch (PDOException $e) {
        echo $e->getMessage();//Remove or change message in production code
        return false;
    }
}
else
    go('../../pages/explore.php');

