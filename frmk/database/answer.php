<?php
require_once('model.php');

class Answer extends Model
{
    public $id;
    public $description;
    public $correct;
    public $question_id;
    public $diffVotes;
    public $data;
    public $username;

    public function  __construct($attr)
    {
        $this->id = $attr['id'];
        $this->description = $attr['descricao'];
        $this->$correct = $attr['correcta'];
        $this->$question_id = $attr['perguntaid'];
        $this->diffVotes = $attr['votos'];
        $this->data = $attr['data'];
        $this->username = $attr['user'];

    }

    static function all($query)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM answers_presentation ORDER BY id;', array());
        else {
            $stmt = parent::query($query, array());
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

    private static function processAnswers($stmt)
    {
        $object = array();

        while ($answer = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Question($answer);
        }

        return $object;
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
}
