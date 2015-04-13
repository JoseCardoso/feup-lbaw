/** AskFEUP **/
/** Triggers **/

.headers ON
.mode columns

CREATE TRIGGER rightAnswer INSTEAD OF UPDATE OF "correcta"
	ON "Resposta"
	WHEN (
			New."correcta" = TRUE
		AND 
			(SELECT COUNT(*) FROM (
				SELECT "correcta" FROM Resposta 
					WHERE "correcta" = TRUE
					AND "Resposta"."perguntaID" = New."perguntaID")
			) AS "bools" > 0
		);
	BEGIN
END;

/** Apagar Utilizador **/
CREATE TRIGGER DeleteUtilizador
BEFORE DELETE ON Utilizador
BEGIN
DELETE FROM Membro , Administrador
	WHERE (Utilizador.utilizadorID = Membro.membroID || Utilizador.utilizadorID = Administrador.administradorID);
END;


/** Apagar Contribuição Geral **/
CREATE TRIGGER DeleteContribuicao
BEFORE DELETE ON Contribuicao
BEGIN
DELETE FROM Pergunta
	WHERE Contribuicao.contribuicaoID = Pergunta.perguntaID;
END;


/** Apagar Pergunta Completa **/
CREATE TRIGGER DeletePergunta
BEFORE DELETE ON Pergunta
BEGIN
DELETE FROM Comentario
	WHERE Pergunta.perguntaID = Comentario.contribuicaoID;
DELETE FROM Resposta
	WHERE Pergunta.perguntaID = Resposta.perguntaID;
END;

/** Apagar Resposta Completa **/
CREATE TRIGGER DeleteResposta
BEFORE DELETE ON Resposta
BEGIN
DELETE FROM Comentario
	WHERE Resposta.respostaID = Comentario.contribuicaoID;
END;
