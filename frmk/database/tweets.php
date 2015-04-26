<?php
  
  function getAllTweets() {
    global $connection;
    $stmt = $connection->prepare("SELECT *
                            FROM tweets JOIN 
                                 users USING(username) 
                            ORDER BY time DESC");
    $stmt->execute();
    return $stmt->fetchAll();
  }
  
  function getUserTweets($username) {
    global $connection;
    $stmt = $connection->prepare("SELECT *
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE username = ? 
                            ORDER BY time DESC");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
  }

  function createTweet($username, $tweet) {
    global $connection;
    $stmt = $connection->prepare("INSERT INTO tweets
                            VALUES (DEFAULT, ?, ?, ?)");
    $stmt->execute(array(date('Y-m-d H:i:s'), $username, $tweet));
  }
  
  function getTweetCountAfter($id) {
    global $connection;
    $stmt = $connection->prepare("SELECT COUNT(*) AS count
                            FROM tweets 
                            WHERE id > ?");
    $stmt->execute(array($id));
    $result = $stmt->fetch();    
    return $result['count'];
  }

  function getTweetsAfter($id) {
    global $connection;
    $stmt = $connection->prepare("SELECT *
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE id > ?
                            ORDER BY time");
    $stmt->execute(array($id));
    return $stmt->fetchAll();
  }

?>
