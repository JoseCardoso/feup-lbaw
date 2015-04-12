/** AskFEUP **/
/** Queries **/

/**.print \n
.width 8 30 **/

/** 1. Lista de perguntas ordenadas por pontuação **/
 SELECT "Pergunta"."perguntaID" AS "ID",
 		"Pergunta".texto AS "Conteudo",
 		"Membro"."primeiroNome" AS "Membro",
 		"Contribuicao"."diferencaVotos" AS "Pontuacao"
 	FROM "Pergunta", "Contribuicao", "Membro"
 	WHERE "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID" AND "Contribuicao"."membroID" = "Membro"."membroID"
 	ORDER BY "Contribuicao"."diferencaVotos" DESC;

/** 8. Lista de respostas a uma pergunta **/
DROP VIEW IF EXISTS respostasAPerguntas;
CREATE VIEW IF NOT EXISTS respostasAPerguntas AS
SELECT Resposta.respostaID FROM Resposta , Pergunta
WHERE Pergunta.perguntaID = Resposta.perguntaID;

/** 9. Lista de comentários a uma contribuição **/
DROP VIEW IF EXISTS comentariosAContribuicao;
CREATE VIEW IF NOT EXISTS comentariosAContribuiçao AS
SELECT Comentário.comentarioID FROM Contribuição , Comentário
WHERE Comentário.contribuiçãoID = Comentário.comentarioID;

/** 10. Lista de utilizador que possuem um determinado Badge **/
DROP VIEW IF EXISTS membroPorBadge;
CREATE VIEW IF NOT EXISTS membroPorBadge AS
SELECT Membro.membroID FROM Membro , Badge, JoinBadgeToMembro
WHERE Membro.membroID = JoinBadgeToMembro.membroID AND Badge.badgeID = JoinBadgeToMembro.badgeID;

/** 11. Lista de badges que pertencem a determinado utilizador **/
DROP VIEW IF EXISTS badgePorMembro;
CREATE VIEW IF NOT EXISTS badgePorMembro AS
SELECT Badge.badgeID FROM Membro , Badge, JoinBadgeToMembro
WHERE Membro.membroID = JoinBadgeToMembro.membroID AND Badge.badgeID = JoinBadgeToMembro.badgeID;

/** 12. Lista de perguntas ordenadas por data de criação (recentes) **/
DROP VIEW IF EXISTS PerguntasOrdenadasPorAno;
CREATE VIEW IF NOT EXISTS PerguntasOrdenadasPorAno AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY Contribuição.data;

/** 13. Lista de perguntas mais populares (votos) **/
DROP VIEW IF EXISTS PerguntasPopulares;
CREATE VIEW IF NOT EXISTS PerguntasPopulares AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY (Contribuição.votosPositivos + contribuição.votosNegativos);