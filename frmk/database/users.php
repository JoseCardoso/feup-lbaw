<?php
  
  function createUser($realname, $username, $password) {
    global $connection;
    $stmt = $connection->prepare("INSERT INTO users VALUES (?, ?, ?)");
    $stmt->execute(array($username, $realname, sha1($password)));
  }

  function isLoginCorrect($username, $password) {
    global $connection;
    $stmt = $connection->prepare("SELECT *
                            FROM users 
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
  }
?>
