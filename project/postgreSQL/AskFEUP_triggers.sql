/** AskFEUP **/
/** Triggers **/

.headers ON
.mode columns

CREATE TRIGGER rightAnswer INSTEAD OF UPDATE OF correcta
	ON Resposta
	WHEN ((New.correcta = true) AND ((SELECT COUNT(*) FROM 
		(	SELECT correcta FROM Resposta 
			WHERE correcta=true			)
		) > 0 ) );
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



CREATE TRIGGER DeleteMembro
AFTER DELETE ON Utilizador
BEGIN
DELETE FROM Membro
	WHERE Utilizador.utilizadorID = Membro.membroID;
END;

CREATE TRIGGER DeleteContribuicaoFromMembro
AFTER DELETE ON Membro
BEGIN
DELETE FROM Contribuicao
	WHERE Contribuicao.membroID = Membro.membroID;
END;

CREATE TRIGGER DeleteContribuicao
AFTER DELETE ON Contribuicao
BEGIN
DELETE FROM Comentario
	WHERE Contribuicao.contribuicaoID = Comentario.comentarioID;
DELETE FROM Pergunta
	WHERE Contribuicao.contribuicaoID = Pergunta.perguntaID;
DELETE FROM Resposta
	WHERE Contribuicao.contribuicaoID = Resposta.respostaID;
END;



