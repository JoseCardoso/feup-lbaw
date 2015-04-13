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
WHERE "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID"
AND "Contribuicao"."membroID" = "Membro"."membroID"
ORDER BY "Contribuicao"."diferencaVotos" DESC;

 /** 2. Lista de perguntas por utilizador (em que tenha actividade e não só as próprias) **/
 SELECT "Pergunta"."perguntaID" AS "ID",
 		"Pergunta".texto AS "Conteudo",
 		"Utilizador".username AS "User"
 	FROM "Pergunta", "Membro", "Comentario", "Resposta", "Contribuicao",
 	WHERE "Resposta"."perguntaID" = "Pergunta"."perguntaID"
 	AND "Membro"."membroID" = "Contribuicao"."membroID"
 	AND "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID"
 	GROUP BY "Pergunta"."perguntaID";

/** 8. Lista de respostas a uma pergunta **/
DROP VIEW IF EXISTS respostasAPerguntas;
SELECT "Resposta"."respostaID"
FROM "Resposta", "Pergunta"
WHERE "Pergunta"."perguntaID" = "Resposta"."perguntaID";

/** 9. Lista de comentários a uma contribuição **/
DROP VIEW IF EXISTS comentariosAContribuicao;
SELECT "Comentario"."comentarioID"
FROM "Contribuicao", "Comentario"
WHERE "Comentario"."contribuicaoID" = "Comentario"."comentarioID";

/** 10. Lista de utilizadores que possuem um determinado Badge (vice-versa) (testado) **/
SELECT "Badge".nome AS "Nome", "Membro"."primeiroNome" AS "Membro"
FROM "Membro", "Badge", "BadgeMembro"
WHERE "Membro"."membroID" = "BadgeMembro"."membroID"
AND "Badge"."badgeID" = "BadgeMembro"."badgeID";

/** 11. Lista de perguntas ordenadas por data de criação (recentes) **/
SELECT "Pergunta"."perguntaID"
FROM "Pergunta", "Contribuicao"
WHERE "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID"
ORDER BY "Contribuicao".data DESC;

/** 12. Lista de perguntas mais populares (votos) **/
DROP VIEW IF EXISTS PerguntasPopulares;
SELECT "Pergunta"."perguntaID"
FROM "Pergunta", "Contribuicao"
WHERE "Pergunta"."perguntaID" = "Contribuicao"."contribuicaoID"
ORDER BY "Contribuicao"."votosPositivos" + "Contribuicao"."votosNegativos" DESC;


/** Lista de Pergunta Favoritas por Utilizador **/
SELECT "Membro"."ultimoNome", "Membro"."primeiroNome", "Pergunta".texto, "Pergunta".descricao
FROM "Membro"
JOIN "Favorita" ON "Membro"."membroID" = "Favorita"."membroID"
JOIN "Pergunta" ON "Favorita"."perguntaID" = "Pergunta"."perguntaID";


/** Lista de Perguntas por Categoria **/
SELECT "Pergunta"."perguntaID", "Pergunta"."categoriaID", "Pergunta".texto, "Pergunta".descricao, "Categoria".tipo
FROM "Pergunta"
JOIN "Categoria" ON "Pergunta"."categoriaID" = "Categoria"."categoriaID";

/** Lista de Respostas assinaladas como Correctas**/
SELECT "Pergunta".texto, "Resposta".correcta, "Resposta".descricao
FROM "Pergunta"
JOIN "Resposta" ON "Pergunta"."perguntaID" = "Resposta"."perguntaID"
WHERE "Resposta".correcta = true;

/** Lista de Perguntas por Tags**/
SELECT "Tag".nome, "Pergunta".texto
FROM "PerguntaTag"
JOIN "Tag" ON "PerguntaTag"."tagID" = "Tag"."tagID"
JOIN "Pergunta" ON "PerguntaTag"."perguntaID" = "Pergunta"."perguntaID";

/** Lista de REspostas dadas por um Membro**/
SELECT "Resposta".correcta, "Resposta".descricao
FROM "Membro"
JOIN "Contribuicao" ON "Membro"."membroID" = "Contribuicao"."membroID"
JOIN "Resposta" ON "Contribuicao"."contribuicaoID" = "Resposta"."respostaID";
