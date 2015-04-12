/** AskFEUP **/
/** Triggers **/

.headers ON
.mode columns

<<<<<<< HEAD
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

/*CREATE TRIGGER GeneratePack
AFTER INSERT ON RecomendacaoInstrumentoAcessorio
WHEN(NEW.prioridade = 10)
BEGIN
INSERT INTO Pack(nome,preco) VALUES ('Auto Pack' || (SELECT 1+MAX(idPack) FROM Pack) ,0);
INSERT INTO ArtigoPack(idArtigo,idPack) VALUES (NEW.idArtigo1,(SELECT MAX(idPack) FROM Pack));
INSERT INTO ArtigoPack(idArtigo,idPack) VALUES (NEW.idArtigo2,(SELECT MAX(idPack) FROM Pack));
END;
*/

CREATE TRIGGER DeleteUtilizador
BEFORE DELETE ON Utilizador
BEGIN
DELETE FROM Membro , Administrador
	WHERE Utilizador.utilizadorID = Membro.membroID || Utilizador.utilizadorID = Administrador.administradorID;
END;

CREATE TRIGGER DeleteContribuicao
BEFORE DELETE ON Contribuicao
BEGIN
DELETE FROM Pergunta
	WHERE Contribuicao.contribuicaoID = Pergunta.perguntaID;
END;

CREATE TRIGGER DeletePergunta
BEFORE DELETE ON Pergunta
BEGIN
DELETE FROM Comentario
	WHERE Pergunta.perguntaID = Comentario.contribuicaoID;
DELETE FROM Resposta
	WHERE Pergunta.perguntaID = Resposta.perguntaID;
END;


CREATE TRIGGER DeleteResposta
BEFORE DELETE ON Resposta
BEGIN
DELETE FROM Comentario
	WHERE Resposta.respostaID = Comentario.contribuicaoID;
END;






