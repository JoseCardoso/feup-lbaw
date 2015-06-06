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

    private static function find_by_name($name)
    {
        $stmt = parent::query('SELECT * FROM tag WHERE nome=?;', array($name));
        $objects = self::processTag($stmt);

        return $objects[0];
    }

    static function generateTags($tags, $question_id)
    {
        global $connection;

        foreach ($tags as $tag_name) {

            // check if object will be created
            $tag = self::find_by_name($tag_name);

            if ($tag) {
                try {
                    // insert relation between tag and question
                    parent::query("INSERT INTO perguntatag(tagid, perguntaid) VALUES (?, ?);", array($tag->id, $question_id));

                } catch (PDOException $ex) {
                    return array(false, $ex->getMessage());
                }

            } else {

                try {

                    $connection->beginTransaction();

                    // insert tag on db
                    $stmt = $connection->prepare("INSERT INTO tag(nome) VALUES (?);");
                    $stmt->execute(array($tag_name));

                    // get last id of tag// get last id from contribution
                    $stmt = $connection->prepare("SELECT last_value FROM askfeup.tag_tagid_seq;");
                    $stmt->execute();
                    $last_tag_id = $stmt->fetch()['last_value'];

                    // insert relation between tag and question
                    $stmt = $connection->prepare("INSERT INTO perguntatag(tagid, perguntaid) VALUES (?, ?)");
                    $stmt->execute(array($last_tag_id, $question_id));

                    $connection->commit();
                } catch (PDOException $ex) {
                    return array(false, $ex->getMessage());
                }
            }
        }

        return array(true, null);
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
}
