<?php
require_once('model.php');

class Admin extends Model {

    public $username;
    public $id;

    public function __construct($array)
    {
        $this->username = $array['username'];
        $this->id = $array['utilizadorid'];
    }

    public static function find($adminId) {
        try {
            $stmt = parent::query("SELECT COUNT(*) FROM administrador, utilizador WHERE administradorid = ? AND utilizadorid=administradorid ;",
                array($adminId));
            if($stmt->fetchall(PDO::FETCH_COLUMN, 0)[0] == 1) {

                $stmt = parent::query("SELECT utilizadorid, username FROM administrador, utilizador WHERE administradorid = ? AND utilizadorid=administradorid ;",
                    array($adminId));

                return new Admin($stmt->fetchall(PDO::FETCH_ASSOC)[0]);
            } else {
                return null;
            }
        } catch(Exception $ex) {
            return null;
        }
    }

    public function logout() {
        $_SESSION['adminid'] = null;
        $_SESSION['adminUsername'] = null;
    }
}