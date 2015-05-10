<?php

require_once('model.php');

class City extends Model {
    public $id;
    public $name;
    public $zip;

    public function __construct($attr) {
        $this->id = $attr['cidadeid'];
        $this->name = $attr['nome'];
        $this->zip = $attr['codigopostal'];
    }

    private static function processCity($stmt) {
        $object = array();

        while($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new City($obj);
        }

        return $object;
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM cidade WHERE cidadeid=?;', array($id));
        $objects = self::processCity($stmt);

        return $objects[0];
    }
}