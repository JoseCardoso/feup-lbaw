<?php
require_once('model.php');

class Answer extends Model
{
    public $id;
    public $description;
    public $correct;
    public $username;
    public $diffVotes;
    public $data;
    public $question_id;

    public function  __construct($attr)
    {
        $this->id = $attr['id'];
        $this->description = $attr['descricao'];
        $this->correct = $attr['correcta'];
        $this->username = $attr['user'];
        $this->diffVotes = $attr['votos'];
        $this->data = $attr['data'];
        $this->question_id = $attr['perguntaid'];

    }

    static function all($query, $params)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM answers_presentation ORDER BY id;', array());
        else {
            $stmt = parent::query($query, $params);
        }
        $answers = self::processAnswers($stmt);

        return $answers;
    }

    static function find($id)
    {
        $stmt = parent::query('SELECT * FROM answers_presentation WHERE id=?;', array($id));
        $answers = self::processAnswers($stmt);

        return $answers[0];
    }

    static function getQuestionsFromUserAnswers($user)
    {
        $stmt = parent::query("SELECT answers_presentation.perguntaid
                                FROM answers_presentation
                                WHERE answers_presentation.user = ?;", array($user));

        return $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
    }

    public static function loadComments($answers) {
        $prop = array_map(function($answer){ return $answer->id; }, $answers);
        $comments = Comment::all_comments_from_contributions($prop);

        return $comments;
    }

    private static function processAnswers($stmt)
    {
        $objects = array();

        while ($answer = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $objects[] = new Answer($answer);
        }

        return $objects;
    }

    public static function createAnswer($question_id, $answer)
    {
        global $connection;

        try {
            $connection->beginTransaction();
            $stmt = $connection->prepare("INSERT INTO contribuicao(data, diferencavotos, votosnegativos, votospositivos, membroid) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute(array(date('Y-m-d G:i:s'), 0, 0, 0, $_SESSION['iduser']));

            // get last id from contribution
            $stmt = $connection->prepare("SELECT last_value FROM askfeup.contribuicao_contribuicaoid_seq;");
            $stmt->execute();
            $last_contribution_id = $stmt->fetch()['last_value'];

            $stmt = $connection->prepare('INSERT INTO resposta(respostaid, correcta, descricao, perguntaid) VALUES (?, ?, ?, ?);');
            $stmt->execute(array($last_contribution_id, 0, $answer, $question_id));

            $connection->commit();

            return self::find($last_contribution_id);

        } catch (PDOException $ex) {
            echo $ex->getMessage();
            return false;
        }
    }

    public static function delete($answer)
    {
        parent::query("DELETE FROM resposta WHERE respostaid=?;", array($answer));
    }

    public function displayUsername()
    {
        return '@' . $this->username;
    }

    public function displayDate()
    {
        $newDate = new DateTime($this->data);
        return $newDate->format('H\hm - d F Y');
    }

    public function get_vote_value($user_id) {
        $stmt = parent::query("SELECT voto.positivo FROM askfeup.voto WHERE voto.contribuicaoid = ? AND voto.membroid = ?", array($this->id, $user_id));

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function processVote($value) {

        $stmt = parent::query("SELECT positivo FROM voto WHERE membroid = ? AND contribuicaoid = ?", array($_SESSION['iduser'], $this->id));

        $exitsVote = $stmt->fetch(PDO::FETCH_ASSOC);

        if($exitsVote) {
            if($exitsVote['positivo']) {
                if ($value)
                    parent::query("DELETE FROM voto WHERE membroid=? AND contribuicaoid=?", array($_SESSION['iduser'], $this->id));
                else
                    parent::query("UPDATE voto SET positivo=? WHERE membroid=? AND contribuicaoid=?", array($value, $_SESSION['iduser'], $this->id));

                return -1;
            } else {
                if ($value)
                    parent::query("UPDATE voto SET positivo=? WHERE membroid=? AND contribuicaoid=?", array($value, $_SESSION['iduser'], $this->id));
                else
                    parent::query("DELETE FROM voto WHERE membroid=? AND contribuicaoid=?", array($_SESSION['iduser'], $this->id));

                return 1;
            }
        } else {
            arent::query("INSERT INTO voto (positivo, membroid, contribuicaoid) VALUES(?, ?, ?)", array($value, $_SESSION['iduser'], $this->id));
            if($value)
                return 1;
            else
                return -1;
        }
    }
}
