/** AskFEUP **/
/** Triggers **/

/** ID Independente entre Contribuição e Pergunta/Resposta **/
/**CREATE FUNCTION askfeup.perguntaRespostaDiferenteID() RETURNS trigger AS $perguntaRespostaDiferenteID$
  begin
    IF NEW.perguntaid IS NOT NULL where(
      new.perguntaid NOT IN ( SELECT contribuicao.contribuicaoid FROM askfeup.contribuicao)
   	) THEN RAISE EXCEPTION 'id for pergunta already in use';
    END IF;
    IF NEW.respostaid IS NOT NULL where(
   	  new.respostaid NOT IN ( SELECT contribuicao.contribuicaoid FROM askfeup.contribuicao)
   	) THEN RAISE EXCEPTION 'id for resposta already in use';
    END IF;
    return new;
  end;
$perguntaRespostaDiferenteID$ LANGUAGE plpgsql;


CREATE TRIGGER perguntaDiferenteID 
BEFORE INSERT OR UPDATE ON askfeup.pergunta
FOR EACH ROW EXECUTE PROCEDURE askfeup.perguntaRespostaDiferenteID();

CREATE TRIGGER respostaDiferenteID 
BEFORE INSERT OR UPDATE ON askfeup.resposta
FOR EACH ROW EXECUTE PROCEDURE askfeup.perguntaRespostaDiferenteID();**/

/** Um utilizador não poder votar na sua contribuição (Pergunta/Resposta) **/
/*CREATE FUNCTION askfeup.notSelfVote() RETURNS trigger AS $notSelfVote$
  begin
    IF NEW.voteid IS NOT NULL THEN 
      new.utilizadorid AND new.contribuicaoid NOT IN (SELECT contribuicao.utilizadorid from contribuicao WHERE new.utilizadorid = contribuicao.utilizadorid AND new.contribuicaoid = contribuicao.contribuicaoid);
    END IF;
    return new;
  end;
$notSelfVote$ LANGUAGE plpgsql;

CREATE TRIGGER notSelfVote 
BEFORE INSERT OR UPDATE ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.notSelfVote();*/

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

