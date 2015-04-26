<?php

function createUser($username, $password) {
    global $connection;
    $stmt = $connection->prepare("INSERT INTO utilizadores VALUES (?, ?)");
    $stmt->execute(array($username, sha1($password)));

    $idUserQuery = $connection->prepare("SELECT ´CURRVAL(utilizadores_utilizadorid_seq)");
    $idUser = $idUserQuery->fetchAll();

    createMember($connection, $firstName, $lastName, $email, $idUser, $idCity);
}

function createMember($conn, $firstName, $lastName, $email, $idUser, $idCity) {
    $stmt = $conn->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute(array('true', $firstName, $lastName, $email, 0, 'current_timestamp', 'current_timestamp'), $idUser, $idCategory);
}

function isLoginCorrect($username, $password) {
    global $connection;
    $stmt = $connection->prepare("SELECT *
                            FROM utilizadores
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
}
?>