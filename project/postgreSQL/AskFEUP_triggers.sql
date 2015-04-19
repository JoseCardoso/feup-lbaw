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



  CREATE FUNCTION perguntaRespostaDiferentID() RETURNS trigger AS $perguntaRespostaDiferentID$
      begin
   			IF NEW.perguntaid IS NOT NULL where(
   				new.perguntaid NOT IN ( SELECT contribuicao.contribuicaoid FROM contribuicao)
   				) THEN RAISE EXCEPTION 'id for pergunta already in use';
        	END IF;
        	IF NEW.respostaid IS NOT NULL where(
   				new.respostaid NOT IN ( SELECT contribuicao.contribuicaoid FROM contribuicao)
   				) THEN RAISE EXCEPTION 'id for resposta already in use';
        	END IF;
        return new;
    end;
$perguntaRespostaDiferentID$ LANGUAGE plpgsql;


CREATE TRIGGER perguntaDiferentID 
  BEFORE INSERT OR UPDATE ON "askfeup"."pergunta"
  FOR EACH ROW EXECUTE PROCEDURE askfeup.perguntaRespostaDiferentID();

  CREATE TRIGGER respostaDiferentID 
  BEFORE INSERT OR UPDATE ON "askfeup"."resposta"
  FOR EACH ROW EXECUTE PROCEDURE askfeup.perguntaRespostaDiferentID();


 CREATE FUNCTION notSelfVote() RETURNS trigger AS $notSelfVote$
      begin
   			IF NEW.voteid IS NOT NULL THEN 
   				new.utilizadorid AND new.contribuicaoid NOT IN (SELECT contribuicao.utilizadorid from contribuicao WHERE new.utilizadorid = contribuicao.utilizadorid AND new.contribuicaoid = contribuicao.contribuicaoid);
   				END IF;
        return new;
    end;
$notSelfVote$ LANGUAGE plpgsql;

 CREATE TRIGGER notSelfVote 
 BEFORE INSERT OR UPDATE ON "askfeup"."voto"
 FOR EACH ROW EXECUTE PROCEDURE askfeup.singlnotSelfVoteeVote();


