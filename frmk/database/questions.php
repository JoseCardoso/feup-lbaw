<?php

function getQuestionsUser() {

    $idUser = $_SESSION['idUser'];

    global $connection;
    $stmt = $connection->prepare("SELECT pergunta.perguntaid as idpergunta,
                                        pergunta.texto as texto,
	                                    utilizador.username as user,
	                                    visualizacoes.views as visualizacoes,
	                                    respostas.answers as respostas,
	                                    contribuicao.data as data
                                FROM askfeup.pergunta, askfeup.utilizador, askfeup.contribuicao,
                                      ( SELECT visualizacao.perguntaid, count(*) AS views
                                        FROM askfeup.visualizacao
                                        GROUP BY visualizacao.perguntaid) visualizacoes,
                                      ( SELECT resposta.perguntaid, count(*) AS answers
                                        FROM askfeup.resposta
                                        GROUP BY resposta.perguntaid) respostas
                                WHERE contribuicao.membroid = utilizador.utilizadorid
                                AND contribuicao.contribuicaoid = pergunta.perguntaid
                                AND visualizacoes.perguntaid = pergunta.perguntaid
                                AND respostas.perguntaid = pergunta.perguntaid
                                AND utilizador.utilizadorid = ?
                                GROUP BY pergunta.perguntaid, utilizador.username, visualizacoes.views, respostas.answers, contribuicao.data");
    $stmt->execute(array($idUser));
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
