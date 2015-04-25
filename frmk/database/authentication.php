<?php

function createUser($username, $password) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO utilizadores VALUES (?, ?)");
    $stmt->execute(array($username, sha1($password)));

    $idUser = $conn->prepare()

    createMember($conn, $firstName, $lastName, $email, $idUser, $idCategory);
}

function createMember($conn, $firstName, $lastName, $email, $idUser, $idCategory) {
    $stmt = $conn->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute(array('true', $firstName, $lastName, $email, 0, 'current_timestamp', 'current_timestamp'), $idUser, $idCategory);
}

function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT *
                            FROM utilizadores
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
}
?>