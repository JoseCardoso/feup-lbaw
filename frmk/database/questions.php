<?php

function getQuestionsUser() {

    $userId = $_SESSION['user'];

    var_dump('USER: ' . $userId);

    global $connection;
    $stmt = $connection->prepare("SELECT perguntaid, pergunta.texto as texto
                                  FROM pergunta, contribuicao
                                  WHERE perguntaid=contribuicaoid AND contribuicao.membroid = ?");
    $stmt->execute(array($userId));
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    var_dump($questions);
}

