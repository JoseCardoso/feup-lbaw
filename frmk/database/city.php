<?php

require_once('model.php');

class City extends Model
{
    public $id;
    public $name;
    public $zip;

    public function __construct($attr)
    {
        if ($attr['cidadeid'])
            $this->id = $attr['cidadeid'];
        else
            $this->id = null;

        if ($attr['nome'])
            $this->name = $attr['nome'];
        else
            $this->name = null;

        if ($attr['codigopostal'])
            $this->zip = $attr['codigopostal'];
        else
            $this->zip = null;
    }

    private static function processCity($stmt)
    {
        $object = array();

        while ($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new City($obj);
        }

        return $object;
    }

    static function all($query)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM cidade ORDER BY codigopostal', array());
        else {
            $stmt = parent::query($query, array());
        }
        $cities = self::processCity($stmt);

        return $cities;
    }

    static function find($id)
    {
        $stmt = parent::query('SELECT * FROM cidade WHERE cidadeid=?;', array($id));
        $objects = self::processCity($stmt);

        return $objects[0];
    }

    static function find_by_name($name) {
        $stmt = parent::query('SELECT * FROM cidade WHERE nome=?;', array($name));
        $objects = self::processCity($stmt);

        return $objects;
    }
}