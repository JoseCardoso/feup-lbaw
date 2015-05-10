<?php

require_once('model.php');

class Contribution extends Model {

    public $id;
    public $data;
    public $diferencaVotos;
    public $votosNegativos;
    public $votosPositivos;
    public $membroId;

    public function __construct($attr) {
        $this->id = $attr['contribuicaoid'];
        $this->data = $attr['data'];
        $this->diferencaVotos = $attr['diferencavotos'];
        $this->votosNegativos = $attr['votosnegativos'];
        $this->votosPositivos = $attr['votospositivos'];
        $this->membroId = $attr['membroid'];
    }

    static function find($id) {
        $stmt = parent::query('SELECT * FROM contribuicao WHERE contribuicaoid=?;', array($id));
        $objects = self::processContribution($stmt);

        return $objects[0];
    }

    private static function processContribution($stmt) {
        $object = array();

        while($obj = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $object[] = new Contribution($obj);
        }

        return $object;
    }

    public function countAnswers() {
        $stmt = parent::query('SELECT COUNT(*) as number FROM resposta WHERE perguntaid=?;', array($this->id));
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['number'];
    }

    public function user() {
        require_once('user.php');
        return User::find($this->membroId);
    }

    public function displayDate() {
        $newDate = new DateTime($this->data);
        return $newDate->format('H\hm - d F Y');
    }
}