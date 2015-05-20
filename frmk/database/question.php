<?php
require_once('model.php');

class Question extends Model
{
    public $id;
    public $text;
    public $description;
    public $diffVotes;
    public $data;
    public $username;
    public $categoryid;
    public $numAnswers;
    public $numViews;

    public function  __construct($attr)
    {
        $this->text = $attr['texto'];
        $this->description = $attr['descricao'];
        $this->categoryid = $attr['categoriaid'];
        $this->id = $attr['perguntaid'];
        $this->data = $attr['data'];
        $this->username = $attr['user'];
        $this->diffVotes = $attr['votos'];
        $this->numAnswers = $attr['respostas'];
        $this->numViews = $attr['visualizacoes'];
    }

    static function all()
    {
        $stmt = parent::query('SELECT * FROM questions_presentation;', array());
        $questions = self::processQuestions($stmt);

        return $questions;
    }

    static function find($id)
    {
        $stmt = parent::query('SELECT * FROM questions_presentation WHERE idpergunta=?;', array($id));
        $questions = self::processQuestions($stmt);

        return $questions[0];
    }

    static function userQuestions($user)
    {
        $stmt = parent::query("SELECT *
                                FROM questions_presentation
                                WHERE questions_presentation.user = ?;", array($user));
        $questions = self::processQuestions($stmt);

        return $questions;
    }

    private static function processQuestions($stmt)
    {
        $classQuestion = array();

        while ($question = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $classQuestion[] = new Question($question);
        }

        return $classQuestion;
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

    /*static function allByOrder($order) {
        $questions = self::all();

        switch($order) {
            case 'date':
                uasort($questions, 'orderByTimeStamp');
                break;
            case 'popular':
                uasort($questions, 'orderByPopularity');
                break;
            case 'votes':
                uasort($questions, 'orderByVotes');
                break;
            default:
                break;
        }

        return $questions;
    }*/
}

/*function orderByTimeStamp($a, $b) {
    if($a->contribution()->data > $b->contribution()->data)
        return false;
    else
        return true;
}*/