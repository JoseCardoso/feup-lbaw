/** AskFEUP **/
/** Queries **/

/**.print \n
.width 8 30 **/

/** 1. Lista de perguntas ordenadas por pontuação (Testado) **/
 SELECT "Pergunta"."perguntaID" AS "ID",
 		"Pergunta".texto AS "Conteudo",
 		"Membro"."primeiroNome" AS "Membro",
 		"Contribuicao"."diferencaVotos" AS "Pontuacao"
 	FROM "Pergunta", "Contribuicao", "Membro"
 	WHERE "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID" AND "Contribuicao"."membroID" = "Membro"."membroID"
 	ORDER BY "Contribuicao"."diferencaVotos" DESC;

 /** 2. Lista de perguntas por utilizador (em que tenha actividade e não só as próprias) **/
 SELECT "Pergunta"."perguntaID" AS "ID",
 		"Pergunta".texto AS "Conteudo",
 		"Utilizador".username AS "User"
 	FROM "Pergunta", "Membro", "Comentario", "Resposta", "Contribuicao",
 	WHERE "Resposta"."respostaID" = "Contribuicao"."contribuicaoID"
 	AND "Membro"."membroID" = "Contribuicao"."membroID"
 	AND "Pergunta"."perguntaID" = "Resposta"."perguntaID"
 	GROUP BY "Pergunta"."perguntaID";

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

/** 10. Lista de utilizadores que possuem um determinado Badge (vice-versa) (testado) **/
SELECT "Badge".nome AS "Nome", "Membro"."primeiroNome" AS "Membro"
	FROM "Membro", "Badge", "BadgeMembro"
	WHERE "Membro"."membroID" = "BadgeMembro"."membroID"
	AND "Badge"."badgeID" = "BadgeMembro"."badgeID";

/** 11. Lista de perguntas ordenadas por data de criação (recentes) **/
DROP VIEW IF EXISTS PerguntasOrdenadasPorAno;
CREATE VIEW IF NOT EXISTS PerguntasOrdenadasPorAno AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY Contribuição.data;

/** 12. Lista de perguntas mais populares (votos) **/
DROP VIEW IF EXISTS PerguntasPopulares;
CREATE VIEW IF NOT EXISTS PerguntasPopulares AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY (Contribuição.votosPositivos + contribuição.votosNegativos);