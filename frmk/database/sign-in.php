<?php

function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT *
                            FROM utilizadores
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
}