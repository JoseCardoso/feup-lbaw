/** AskFEUP **/
/** Triggers **/

/** ID Independente entre Contribuição e Pergunta/Resposta **/
CREATE FUNCTION askfeup.independentQuestion() RETURNS trigger AS $independentQuestion$
  begin
    IF new.perguntaid NOT IN
      (SELECT respostaid
      FROM askfeup.resposta
      WHERE new.perguntaid = respostaid)
      THEN return new;
    END IF;
    RAISE EXCEPTION 'id % for this type of contribuition is already in use', new.perguntaid;
  end;
$independentQuestion$ LANGUAGE plpgsql;

CREATE FUNCTION askfeup.independentAnswer() RETURNS trigger AS $independentAnswer$
  begin
   IF new.respostaid NOT IN
      (SELECT perguntaid
      FROM askfeup.pergunta
      WHERE perguntaid = new.respostaid)
      THEN return new;
    END IF;
    RAISE EXCEPTION 'id % for this type of contribuition is already in use', new.respostaid;
  end;
$independentAnswer$ LANGUAGE plpgsql;

CREATE TRIGGER independentQuestion 
BEFORE INSERT OR UPDATE ON askfeup.pergunta
FOR EACH ROW EXECUTE PROCEDURE askfeup.independentQuestion();

CREATE TRIGGER independentAnswer 
BEFORE INSERT OR UPDATE ON askfeup.resposta
FOR EACH ROW EXECUTE PROCEDURE askfeup.independentAnswer();

/** Um utilizador não poder votar na sua contribuição (Pergunta/Resposta) **/
CREATE FUNCTION askfeup.notSelfVote() RETURNS trigger AS $notSelfVote$
  BEGIN
    IF new.membroid NOT IN
        (SELECT membroid
        FROM askfeup.contribuicao
        WHERE new.membroid = contribuicao.membroid
        AND new.contribuicaoid = contribuicao.contribuicaoid)
        THEN return new;
    END IF;
    RAISE EXCEPTION 'user with id % cannot vote in his own contribuition %', new.membroid, new.contribuicaoid;
  end;
$notSelfVote$ LANGUAGE plpgsql;

CREATE TRIGGER notSelfVote
BEFORE INSERT ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.notSelfVote();

/** Actualizar votos**/
CREATE FUNCTION askfeup.incrementVotes() RETURNS trigger AS $incrementVotes$
  BEGIN
    IF new.positivo = 'true'
      THEN UPDATE Contribuicao SET votosPositivos = votosPositivos + 1, diferencavotos = diferencavotos + 1
      WHERE new.contribuicaoID = contribuicaoID;
    ELSE
      UPDATE Contribuicao SET votosNegativos = votosNegativos + 1, diferencavotos = diferencavotos - 1
      WHERE new.contribuicaoID = contribuicaoID;
    END IF;
    return new;
  END;
$incrementVotes$ LANGUAGE plpgsql;

CREATE FUNCTION askfeup.decrementVotes() RETURNS trigger AS $decrementVotes$
  BEGIN
    IF new.positivo = 'true'
      THEN UPDATE Contribuicao SET votosPositivos = votosPositivos - 1, diferencavotos = diferencavotos - 1
      WHERE new.contribuicaoID = contribuicaoID;
    ELSE
      UPDATE Contribuicao SET votosNegativos = votosNegativos - 1, diferencavotos = diferencavotos + 1
      WHERE new.contribuicaoID = contribuicaoID;
    END IF;
    return new;
  END;
$decrementVotes$ LANGUAGE plpgsql;

CREATE TRIGGER incVotes
BEFORE INSERT ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.incrementVotes();

CREATE TRIGGER decVotes 
BEFORE DELETE ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.decrementVotes();


CREATE FUNCTION askFeup.perguntaRespostaDiferentID() RETURNS trigger AS $perguntaRespostaDiferentID$
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

