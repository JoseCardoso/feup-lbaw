<?php
require_once('model.php');

class Question extends Model {
    public $id;
    public $text;
    public $description;
    public $categoriaId;

    public function  __construct($attr) {
        $this->text = $attr['texto'];
        $this->description = $attr['descricao'];
        $this->categoriaId = $attr['categoriaid'];
        $this->id = $attr['perguntaid'];
    }

    static function all() {
        $stmt = parent::query('SELECT * FROM pergunta;');
        $questions = self::processQuestions($stmt);

        return $questions;
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM pergunta WHERE id=?;', array($id));
        $questions = self::processQuestions($stmt);

        return $questions[0];
    }

    static function userQuestions($user) {
        $stmt = parent::query("SELECT pergunta.*
                                FROM pergunta, utilizador, contribuicao
                                WHERE contribuicao.membroid = utilizador.utilizadorid
                                AND contribuicao.contribuicaoid = pergunta.perguntaid
                                AND utilizador.utilizadorid = ?", array($user));
        $questions = self::processQuestions($stmt);

        return $questions;
    }

    private static function processQuestions($stmt) {
        $classQuestion = array();

        while($question = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $classQuestion[] = new Question($question);
        }

        return $classQuestion;
    }

    public function contribution() {
        require_once('contribution.php');
        return Contribution::find($this->id);
    }
}