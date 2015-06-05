<?php

require_once('model.php');

class Category extends Model
{
    public $id;
    public $type;

    public function __construct($attr)
    {
        $this->id = $attr['categoriaid'];
        $this->type = $attr['tipo'];
    }

    private static function processCategory($stmt)
    {
        $object = array();

        while ($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Category($obj);
        }

        return $object;
    }

    static function all($query)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM categoria', array());
        else {
            $stmt = parent::query($query, array());
        }
        $categories = self::processCategory($stmt);

        return $categories;
    }

    static function find_by_id($id)
    {
        $stmt = parent::query('SELECT * FROM categoria WHERE categoriaid=?;', array($id));
        $objects = self::processCategory($stmt);

        return $objects[0];
    }

    static function find_by_type($type) {
        $stmt = parent::query('SELECT * FROM categoria WHERE tipo=?;', array($type));
        $objects = self::processCategory($stmt);

        return $objects[0];
    }
}