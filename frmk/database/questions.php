<?php

function getQuestionsUser() {
    $idUser = $_SESSION['idUser'];

    global $connection;
    $stmt = $connection->prepare("SELECT pergunta.perguntaid as idpergunta,
                                        pergunta.texto as texto,
                                      utilizador.username as user,
                                      votos.votes as votos,
                                      respostas.answers as respostas,
                                      contribuicao.data as data
                                FROM askfeup.pergunta, askfeup.utilizador, askfeup.contribuicao,
                                      ( SELECT voto.contribuicaoid, count(*) AS votes
                                        FROM askfeup.voto
                                        GROUP BY voto.contribuicaoid) votos,
                                      ( SELECT resposta.perguntaid, count(*) AS answers
                                        FROM askfeup.resposta
                                        GROUP BY resposta.perguntaid) respostas
                                WHERE contribuicao.membroid = utilizador.utilizadorid
                                AND contribuicao.contribuicaoid = pergunta.perguntaid
                                AND votos.contribuicaoid = pergunta.perguntaid
                                AND respostas.perguntaid = pergunta.perguntaid
                                AND utilizador.utilizadorid = ?
                                GROUP BY pergunta.perguntaid, utilizador.username, votos.votes, respostas.answers, contribuicao.data");
    $stmt->execute(array($idUser));
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $questions = processQuestions($questions);

    return $questions;
}

function getAllQuestions() {
    global $connection;
    $stmt = $connection->prepare("SELECT pergunta.perguntaid as idpergunta,
                                        pergunta.texto as texto,
                                      utilizador.username as user,
                                      votos.votes as votos,
                                      respostas.answers as respostas,
                                      contribuicao.data as data
                                FROM askfeup.pergunta, askfeup.utilizador, askfeup.contribuicao,
                                      ( SELECT voto.contribuicaoid, count(*) AS votes
                                        FROM askfeup.voto
                                        GROUP BY voto.contribuicaoid) votos,
                                      ( SELECT resposta.perguntaid, count(*) AS answers
                                        FROM askfeup.resposta
                                        GROUP BY resposta.perguntaid) respostas
                                WHERE contribuicao.membroid = utilizador.utilizadorid
                                AND contribuicao.contribuicaoid = pergunta.perguntaid
                                AND votos.contribuicaoid = pergunta.perguntaid
                                AND respostas.perguntaid = pergunta.perguntaid
                                GROUP BY pergunta.perguntaid, utilizador.username, votos.votes, respostas.answers, contribuicao.data
                                ORDER BY contribuicao.data DESC");
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $questions = processQuestions($questions);

    return $questions;
}

function processQuestions($questions) {
    foreach ($questions as $question => $value) {
        //user updating
        $questions[$question]['user'] = '@' . $value['user'];

        // date updating
        $newDate = new DateTime($value['data']);
        $questions[$question]['data'] = $newDate->format('H\hm - d F Y');
    }

    return $questions;
}

