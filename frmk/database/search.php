<?php /**
 * Get user with username $username
 * @param $username String with user username
 * @return User Return user of type User
 */
if (isset($_GET['word'])) {

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

