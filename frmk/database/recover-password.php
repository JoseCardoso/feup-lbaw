<?php

require_once('model.php');

class RecoverPassword extends Model {
    public $id;
    public $code;
    public $date;
    public $memberid;

    public function __construct($attr) {
        $this->id = $attr['recuperacaodepasswordid'];
        $this->code = $attr['codigovalidacao'];
        $this->date = $attr['data'];
        $this->memberid = $attr['membroid'];
    }

    private static function processRecoverPassword($stmt) {
        $object = array();

        while($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new RecoverPassword($obj);
        }

        return $object;
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM recuperacaodepassword WHERE recuperacaodepasswordid=?;', array($id));
        $objects = self::processRecoverPassword($stmt);

        return $objects[0];
    }
}