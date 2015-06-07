<?php
require_once('model.php');
require_once('comment.php');

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
        $this->id = $attr['id'];
        $this->numAnswers = $attr['respostas'];
        $this->numViews = $attr['visualizacoes'];
        $this->text = $attr['texto'];
        $this->description = $attr['descricao'];
        $this->category_id = $attr['categoria'];
        $this->username = $attr['user'];
        $this->diffVotes = $attr['votos'];
        $this->data = $attr['data'];
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
        $stmt = parent::query('SELECT * FROM questions_presentation WHERE id=?;', array($id));
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

    static function userAnsweredQuestions($answers)
    {
        $objects = array();
        foreach ($answers as $answer) {
            $objects[] = self::find($answer);
        }

        return $objects;
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
        $object = array();

        while ($question = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Question($question);
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

    public function loadComments() {
        $comments = Comment::all_comments_from_contributions(array($this->id));

        return $comments;
    }

    public function check_if_question_is_favourite($user_id) {
        $stmt = parent::query("SELECT perguntaid, membroid FROM favorita WHERE perguntaid = ? AND membroid = ?;", array($this->id, $user_id));

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function get_vote_value($user_id) {
        $stmt = parent::query("SELECT voto.positivo FROM askfeup.voto WHERE voto.contribuicaoid = ? AND voto.membroid = ?", array($this->id, $user_id));

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
