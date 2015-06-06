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
        $this->id = $attr['id'];
        $this->data = $attr['data'];
        $this->description = $attr['descricao'];
        $this->$question_id = $attr['contribuicaoid'];
        $this->username = $attr['membroid'];

    }
}