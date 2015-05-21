<?php

require_once('model.php');

class User extends Model
{
    public $id;
    public $username;
    public $firstName;
    public $lastName;
    public $email;
    public $points;
    public $cityId;
    public $register_at;
    public $lastLogin_at;

    public function __construct($attr)
    {
        $this->id = $attr['membroid'];
        $this->username = $attr['username'];
        $this->firstName = $attr['primeironome'];
        $this->lastName = $attr['ultimonome'];
        $this->email = $attr['email'];
        $this->points = $attr['pontos'];
        $this->cityId = $attr['cidadeid'];
        $this->register_at = $attr['registo'];
        $this->lastLogin_at = $attr['ultimologin'];
    }

    private static function processUser($stmt)
    {
        $object = array();

        while ($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new User($obj);
        }

        return $object;
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM membro, utilizador WHERE membroid=? AND membroid=utilizadorid;', array($id));
        $objects = self::processUser($stmt);

        return $objects[0];
    }

    static function login($username, $password)
    {
        global $connection;
        $user = null;

        try {
            $connection->beginTransaction();

            /* Getting user from db*/
            $user = $connection->prepare("SELECT * FROM utilizador, membro WHERE username = ? AND password = ? AND membroid = utilizadorid;");
            $user->execute(array($username, hash('sha256', $password)));
            $iduser = $user->fetch()['utilizadorid'];

            /* Updating lastlogin_at */
            $lastlogin = $connection->prepare("UPDATE membro SET ultimologin = ? WHERE membroid = ?");
            $lastlogin->execute(array(date('Y-m-d G:i:s'), $iduser));

            $connection->commit();

            $user = self::find($iduser);

            if ($user)
                return array(true, $user);
            else
                return array(false, null);

        } catch (PDOException $e) {
            $connection->rollBack();
            echo nl2br("Login failed: " . $e->getMessage());

            $_SESSION['error_messages'][] = 'Error in login user';
            $_SESSION['form_values'] = $_POST;
        }
    }

    static function register($username, $password, $firstName, $lastName, $email)
    {
        global $connection;

        try {
            $connection->beginTransaction();

            /* insert user on db */
            $stmt = $connection->prepare("INSERT INTO utilizador(username, password) VALUES (?, ?)");
            $stmt->execute(array($username, hash('sha256', $password)));

            /* gets last id from user */
            $idUserQuery = $connection->prepare("SELECT utilizadorid FROM utilizador ORDER BY utilizadorid DESC LIMIT 1");
            $idUserQuery->execute();
            $idUser = $idUserQuery->fetch()['utilizadorid'];

            $stmt = $connection->prepare("INSERT INTO membro VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            $timestamp = date('Y-m-d G:i:s');
            $stmt->execute(array(1, $firstName, $lastName, $email, NULL, $timestamp, $timestamp, $idUser));

            $connection->commit();

            return self::find($idUser);

        } catch (PDOException $e) {
            $connection->rollBack();
            echo nl2br("Register failed: " . $e->getMessage());

            if (strpos($e->getMessage(), 'users_pkey') !== false) {
                $_SESSION['error_messages'][] = 'Duplicate username';
                $_SESSION['field_errors']['username'] = 'Username already exists';
            } else {
                $_SESSION['error_messages'][] = 'Error creating user';
            }

            $_SESSION['form_values'] = $_POST;
            return false;
        }
    }

    public function city()
    {
        require_once('city.php');
        return City::find($this->id);
    }

    public function displayUsername() {
        return '@' . $this->username;
    }
}