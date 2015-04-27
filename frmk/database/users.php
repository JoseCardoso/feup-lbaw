<?php

function getProfile() {
    $userId = $_SESSION['user'];

    global $connection;
    $stmt = $connection->prepare("SELECT email, username FROM utilizador, membro WHERE membroid=utilizadorid AND membroid=?");
    $stmt->execute(array($userId));
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

