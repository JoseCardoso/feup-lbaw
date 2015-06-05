<?php

require_once('model.php');

class Tag extends Model
{
    public $id;
    public $name;

    public function __construct($attr)
    {
        $this->id = $attr['tagid'];
        $this->name = $attr['nome'];
    }

    private static function processTag($stmt)
    {
        $object = array();

        while ($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Tag($obj);
        }

        return $object;
    }

    static function processTags($tags, $question_id) {
        foreach($tags as $tag) {
            try {
                $stmt = parent::query("SELECT tagid FROM tag WHERE nome=?", array($tag));

                $tag_id = $stmt->fetch(PDO::FETCH_ASSOC)['tagid'];

                if($tag_id) {
                    // TODO tas already exist just need to associate to question
                }

                else {
                    // TODO tas does not exists ; need to create on db and associate
                }

            } catch(PDOException $ex) {
                echo $ex->getTraceAsString();
            }
        }

        exit();
    }

    static function all($query)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM categoria', array());
        else {
            $stmt = parent::query($query, array());
        }
        $tags = self::processTag($stmt);

        return $tags;
    }

    static function find_by_id($id)
    {
        $stmt = parent::query('SELECT * FROM tag WHERE tagid=?;', array($id));
        $objects = self::processTag($stmt);

        return $objects[0];
    }

    static function find_by_name($name) {
        $stmt = parent::query('SELECT * FROM tag WHERE nome=?;', array($name));
        $objects = self::processTag($stmt);

        return $objects[0];
    }
}