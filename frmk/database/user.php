<?php

require_once('model.php');

class User extends Model {
    public $id;
    public $username;
    public $firstName;
    public $lastName;
    public $email;
    public $points;
    public $cityId;
    public $register_at;
    public $lastLogin_at;

    public function __construct($attr) {
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

        while($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new User($obj);
        }

        return $object;
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM membro, utilizador WHERE membroid=? AND membroid=utilizadorid;', array($id));
        $objects = self::processUser($stmt);

        return $objects[0];
    }

    public function displayUsername() {
        return '@'.$this->username;
    }

}