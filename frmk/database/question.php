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
    public $category_id;
    public $numAnswers;
    public $numViews;

    public function  __construct($attr)
    {
        $this->text = $attr['texto'];
        $this->description = $attr['descricao'];
        $this->category_id = $attr['categoriaid'];
        $this->id = $attr['perguntaid'];
        $this->data = $attr['data'];
        $this->username = $attr['user'];
        $this->diffVotes = $attr['votos'];
        $this->numAnswers = $attr['respostas'];
        $this->numViews = $attr['visualizacoes'];
    }

    static function all($query)
    {
        if (!$query)
            $stmt = parent::query('SELECT * FROM questions_presentation ORDER BY data DESC;', array());
        else {
            $stmt = parent::query($query, array());
        }
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

    static function createQuestion($text, $description, $category)
    {
        global $connection;

        try {
            $connection->beginTransaction();

            // insert contribution
            $stmt = $connection->prepare("INSERT INTO contribuicao(data, diferencavotos, votosnegativos, votospositivos, membroid) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute(array(date('Y-m-d G:i:s'), 0, 0, 0, $_SESSION['iduser']));

            // get last id from contribution
            $stmt = $connection->prepare("SELECT last_value FROM askfeup.contribuicao_contribuicaoid_seq;");
            $stmt->execute();
            $last_contribution_id = $stmt->fetch()['last_value'];

            // insert question
            $stmt = $connection->prepare("INSERT INTO pergunta(perguntaid, texto, descricao, categoriaid) VALUES (?, ?, ?, ?)");
            $stmt->execute(array($last_contribution_id, $text, $description, $category));

            $connection->commit();

        } catch (PDOException $ex) {
            echo $ex->getTraceAsString();
        }

        return $last_contribution_id;
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
}
