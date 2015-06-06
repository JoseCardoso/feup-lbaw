<?php
require_once('model.php');

class Comment extends Model
{
    public $id;
    public $data;
    public $description;
    public $contribution_id;
    public $member_id;

    public function  __construct($attr)
    {
        $this->id = $attr['comentarioid'];
        $this->data = $attr['data'];
        $this->description = $attr['descricao'];
        $this->contribution_id = $attr['contribuicaoid'];
        $this->member_id = $attr['membroid'];
    }

    private static function processComments($stmt)
    {
        $object = array();

        while ($answer = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Comment($answer);
        }

        return $object;
    }

    public static function all_comments_from_contributions($contributions_ids)
    {
        $string = '';
        foreach($contributions_ids as $contribution_id) {
            $string .= 'OR contribuicaoid = ?';
        }
        $string = substr($string, 3);
        $stmt = parent::query('SELECT * FROM comentario WHERE '.$string.' ORDER BY comentarioid;', $contributions_ids);

        return self::processComments($stmt);
    }
}