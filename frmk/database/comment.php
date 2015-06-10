<?php
require_once('model.php');

class Comment extends Model
{
    public $id;
    public $data;
    public $description;
    public $contribution_id;
    public $member_id;
    public $username;

    public function  __construct($attr)
    {
        $this->id = $attr['comentarioid'];
        $this->data = $attr['data'];
        $this->description = $attr['descricao'];
        $this->contribution_id = $attr['contribuicaoid'];
        $this->member_id = $attr['membroid'];
        $this->username = $attr['username'];
    }

    public static function all($query, $params)
    {
        if ($query)
            $stmt = parent::query($query, $params);
        else
            $stmt = parent::query("SELECT comentario.*, username FROM comentario, utilizador WHERE utilizadorid = membroid ORDER BY data;", null);

        $comments = self::processComments($stmt);

        return $comments;
    }

    static function find($id)
    {
        $stmt = parent::query('SELECT comentario.*, username FROM comentario, utilizador WHERE comentarioid=? AND utilizadorid = membroid;', array($id));
        $comments = self::processComments($stmt);

        return $comments[0];
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
        foreach ($contributions_ids as $contribution_id) {
            $string .= 'OR contribuicaoid = ?';
        }
        $string = substr($string, 3);
        $stmt = parent::query('SELECT comentario.*, username FROM comentario, utilizador WHERE (' . $string . ') AND utilizadorid = membroid ORDER BY comentarioid;', $contributions_ids);

        return self::processComments($stmt);
    }

    public static function createComment($contribution_id, $comment)
    {
        try {
            // insert comment on db
            parent::query("INSERT INTO comentario(data, descricao, contribuicaoid, membroid) VALUES (?, ?, ?, ?)", array(date('Y-m-d G:i:s'), $comment, $contribution_id, $_SESSION['iduser']));

            // get last id from comment
            $stmt = parent::query("SELECT last_value FROM askfeup.comentario_comentarioid_seq;", array());
            $last_contribution_id = $stmt->fetch()['last_value'];

            return self::find($last_contribution_id);

        } catch (PDOException $ex) {
            return $ex->getMessage();
        }
    }

    public static function delete($comment)
    {
        parent::query("DELETE FROM comentario WHERE comentarioid=?;", array($comment));
    }
}
