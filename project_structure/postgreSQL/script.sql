/** AskFEUP **/
/** Script Base de dados **/

/** AskFEUP **/
/** Tables **/

DROP SCHEMA IF EXISTS askfeup;
CREATE SCHEMA askfeup;

/*-------------- Utilizador --------------*/

DROP TABLE IF EXISTS askfeup.Utilizador;
CREATE TABLE IF NOT EXISTS askfeup.Utilizador (
	utilizadorID serial NOT NULL,
	username text NOT NULL,
	password text NOT NULL,
	CONSTRAINT UK_Utilizador_username UNIQUE (username)
);

ALTER TABLE askfeup.Utilizador ADD CONSTRAINT PK_Utilizador PRIMARY KEY (utilizadorID);

/*-------------- Administrador --------------*/

DROP TABLE IF EXISTS askfeup.Administrador;
CREATE TABLE IF NOT EXISTS askfeup.Administrador ( 
	administradorID integer NOT NULL
);

ALTER TABLE askfeup.Administrador ADD CONSTRAINT PK_Administrador PRIMARY KEY (administradorID);

ALTER TABLE askfeup.Administrador ADD CONSTRAINT FK_Administrador_Utilizador
	FOREIGN KEY (administradorID) REFERENCES askfeup.Utilizador (utilizadorID) ON DELETE CASCADE;

/*-------------- Cidade --------------*/

DROP TABLE IF EXISTS askfeup.Cidade;
CREATE TABLE IF NOT EXISTS askfeup.Cidade (
	cidadeID serial NOT NULL,
	nome varchar(20) NOT NULL,
	codigoPostal int NOT NULL,
	CONSTRAINT UK_Cidade_codigoPostal UNIQUE (codigoPostal)	
);

ALTER TABLE askfeup.Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (cidadeID);

/*-------------- Membro --------------*/

DROP TABLE IF EXISTS askfeup.Membro;
CREATE TABLE IF NOT EXISTS askfeup.Membro (
	activo boolean,
	primeiroNome varchar(20) NOT NULL,
	ultimoNome varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	pontos int NULL,
	registo timestamp DEFAULT current_timestamp,
	ultimoLogin timestamp NOT NULL,
	membroID integer NOT NULL,
	cidadeID integer NOT NULL,
	CONSTRAINT UK_Membro_email UNIQUE (email)
);

ALTER TABLE askfeup.Membro ADD CONSTRAINT PK_Membro PRIMARY KEY (membroID);

ALTER TABLE askfeup.Membro ADD CONSTRAINT FK_Membro_Cidade 
	FOREIGN KEY (cidadeID) REFERENCES askfeup.Cidade (cidadeID);

ALTER TABLE askfeup.Membro ADD CONSTRAINT FK_Membro_Utilizador 
	FOREIGN KEY (membroID) REFERENCES askfeup.Utilizador (utilizadorID) ON DELETE CASCADE;

/*-------------- Contribuicao --------------*/

DROP TABLE IF EXISTS askfeup.Contribuicao;
CREATE TABLE IF NOT EXISTS askfeup.Contribuicao (
	contribuicaoID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	diferencaVotos integer NULL,
	votosNegativos integer NULL,
	votosPositivos integer NULL,
	membroID integer NOT NULL
);

ALTER TABLE askfeup.Contribuicao ADD CONSTRAINT PK_Contribuicao PRIMARY KEY (contribuicaoID);

/*-------------- Categoria --------------*/

DROP TABLE IF EXISTS askfeup.Categoria;
CREATE TABLE IF NOT EXISTS askfeup.Categoria (
	categoriaID serial NOT NULL,
	tipo varchar(50) NOT NULL,
	CONSTRAINT UK_Categoria_tipo UNIQUE (tipo)
);

ALTER TABLE askfeup.Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoriaID);

/*-------------- Pergunta --------------*/

DROP TABLE IF EXISTS askfeup.Pergunta;
CREATE TABLE IF NOT EXISTS askfeup.Pergunta ( 
	perguntaID integer NOT NULL,
	texto text NOT NULL,
	descricao text NULL,
	categoriaID integer NOT NULL
);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT PK_Pergunta PRIMARY KEY (perguntaID);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT FK_Pergunta_Categoria 
	FOREIGN KEY (categoriaID) REFERENCES askfeup.Categoria (categoriaID);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT FK_Pergunta_Contribuicao 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Contribuicao (contribuicaoID) ON DELETE CASCADE;

/*-------------- Tag --------------*/

DROP TABLE IF EXISTS askfeup.Tag;
CREATE TABLE IF NOT EXISTS askfeup.Tag (
	tagID serial NOT NULL,
	nome varchar(20) NOT NULL,
	CONSTRAINT UK_Tag_nome UNIQUE (nome)
);

ALTER TABLE askfeup.Tag ADD CONSTRAINT PK_Tag PRIMARY KEY (tagID);

/*-------------- Badge --------------*/

DROP TABLE IF EXISTS askfeup.Badge;
CREATE TABLE IF NOT EXISTS askfeup.Badge (
	badgeID serial NOT NULL,
	nome varchar(50) NOT NULL,
	descricao text,
	CONSTRAINT UK_Badge_nome UNIQUE (nome)
);

ALTER TABLE askfeup.Badge ADD CONSTRAINT PK_Badge PRIMARY KEY (badgeID);

/*-------------- Comentario --------------*/

DROP TABLE IF EXISTS askfeup.Comentario;
CREATE TABLE IF NOT EXISTS askfeup.Comentario (
	comentarioID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	descricao text NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NULL
);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT PK_Comentario PRIMARY KEY (comentarioID);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT FK_Comentario_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT FK_Comentario_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE SET NULL;

/*-------------- Favorita --------------*/

DROP TABLE IF EXISTS askfeup.Favorita;
CREATE TABLE IF NOT EXISTS askfeup.Favorita (
	membroID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askfeup.Favorita ADD CONSTRAINT PK_Favorita PRIMARY KEY (membroID, perguntaID);

ALTER TABLE askfeup.Favorita ADD CONSTRAINT FK_Favorita_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

ALTER TABLE askfeup.Favorita ADD CONSTRAINT FK_Favorita_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID) ON DELETE CASCADE;

/*-------------- BadgeMembro --------------*/

DROP TABLE IF EXISTS askfeup.BadgeMembro;
CREATE TABLE IF NOT EXISTS askfeup.BadgeMembro (
	membroID integer NOT NULL,
	badgeID integer NOT NULL
);

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT PK_BadgeMembro PRIMARY KEY (membroID, badgeID);

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT Badge 
	FOREIGN KEY (badgeID) REFERENCES askfeup.Badge (badgeID) ON DELETE CASCADE;

/*-------------- PerguntaTag --------------*/

DROP TABLE IF EXISTS askfeup.PerguntaTag;
CREATE TABLE IF NOT EXISTS askfeup.PerguntaTag (
	tagID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT PK_PerguntaTag PRIMARY KEY (perguntaID, tagID);

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Tag
	FOREIGN KEY (tagID) REFERENCES askfeup.Tag (tagID) ON DELETE CASCADE;

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID) ON DELETE CASCADE;

/*-------------- Notificacao --------------*/

DROP TABLE IF EXISTS askfeup.Notificacao;
CREATE TABLE IF NOT EXISTS askfeup.Notificacao (
	notificacaoID serial NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT PK_Notificacao PRIMARY KEY (notificacaoID);

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT FK_Notificacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT FK_Notificacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID) ON DELETE CASCADE;

/*-------------- RecuperacaoDePassword --------------*/

DROP TABLE IF EXISTS askfeup.RecuperacaoDePassword;
CREATE TABLE IF NOT EXISTS askfeup.RecuperacaoDePassword (
	recuperacaoDePasswordID serial NOT NULL,
	codigoValidacao varchar(50) NOT NULL,
	data timestamp DEFAULT current_timestamp,
	membroID integer NOT NULL,
	CONSTRAINT UK_RecuperacaoDePassword_codigoValidacao UNIQUE (codigoValidacao)
);

ALTER TABLE askfeup.RecuperacaoDePassword ADD CONSTRAINT PK_RecuperacaoDePassword PRIMARY KEY (recuperacaoDePasswordID);

ALTER TABLE askfeup.RecuperacaoDePassword ADD CONSTRAINT FK_RecuperacaoDePassword_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

/*-------------- Resposta --------------*/

DROP TABLE IF EXISTS askfeup.Resposta;
CREATE TABLE IF NOT EXISTS askfeup.Resposta (
	respostaID integer NOT NULL,
	correcta boolean,
	descricao text NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askfeup.Resposta ADD CONSTRAINT PK_Resposta PRIMARY KEY (respostaID);

ALTER TABLE askfeup.Resposta ADD CONSTRAINT FK_Resposta_Contribuicao 
	FOREIGN KEY (respostaID) REFERENCES askfeup.Contribuicao (contribuicaoID) ON DELETE CASCADE;

ALTER TABLE askfeup.Resposta ADD CONSTRAINT FK_Resposta_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID) ON DELETE CASCADE;

/*-------------- Voto --------------*/

DROP TABLE IF EXISTS askfeup.Voto;
CREATE TABLE IF NOT EXISTS askfeup.Voto (
	positivo boolean,
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE askfeup.Voto ADD CONSTRAINT PK_Voto PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE askfeup.Voto ADD CONSTRAINT FK_Voto_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

ALTER TABLE askfeup.Voto ADD CONSTRAINT FK_Voto_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID) ON DELETE CASCADE;

/*-------------- Visualizacao --------------*/

DROP TABLE IF EXISTS askfeup.Visualizacao;
CREATE TABLE IF NOT EXISTS askfeup.Visualizacao (
	membroID integer NOT NULL,
	PerguntaID integer NOT NULL
);

ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT PK_Visualizacao PRIMARY KEY (membroID, perguntaID);


ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT FK_Visualizacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID) ON DELETE CASCADE;

ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT FK_Visualizacao_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID) ON DELETE CASCADE;

/** AskFEUP **/
/** Indexes **/
/*CREATE INDEX pergunta_fti_texto_idx
ON askfeup.Pergunta USING gin(to_tsvector(texto));*/ /* Full text search */

CREATE INDEX membro_primeironome 
ON askfeup.membro USING btree (primeironome);

CREATE INDEX membro_ultimonome 
ON askfeup.membro USING btree (ultimonome);

CLUSTER askfeup.membro USING pk_membro;

CLUSTER askfeup.contribuicao USING pk_contribuicao;

CLUSTER askfeup.pergunta USING pk_pergunta;

CLUSTER askfeup.utilizador USING pk_utilizador;

CLUSTER askfeup.tag USING pk_tag;

CLUSTER askfeup.categoria USING pk_categoria;

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
BEFORE INSERT OR UPDATE ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.notSelfVote();

/** Actualizar votos**/
CREATE FUNCTION askfeup.incrementVotes() RETURNS trigger AS $incrementVotes$
  BEGIN
    IF new.positivo = 'true'
      THEN UPDATE askfeup.Contribuicao SET votosPositivos = votosPositivos + 1, diferencavotos = diferencavotos + 1
      WHERE new.contribuicaoID = contribuicaoID;
    ELSE
      UPDATE askfeup.Contribuicao SET votosNegativos = votosNegativos + 1, diferencavotos = diferencavotos - 1
      WHERE new.contribuicaoID = contribuicaoID;
    END IF;
    return new;
  END;
$incrementVotes$ LANGUAGE plpgsql;

CREATE FUNCTION askfeup.decrementVotes() RETURNS trigger AS $decrementVotes$
  BEGIN
    IF new.positivo = 'true'
      THEN UPDATE askfeup.Contribuicao SET votosPositivos = votosPositivos - 1, diferencavotos = diferencavotos - 1
      WHERE new.contribuicaoID = contribuicaoID;
    ELSE
      UPDATE askfeup.Contribuicao SET votosNegativos = votosNegativos - 1, diferencavotos = diferencavotos + 1
      WHERE new.contribuicaoID = contribuicaoID;
    END IF;
    return new;
  END;
$decrementVotes$ LANGUAGE plpgsql;

CREATE TRIGGER incVotes
AFTER INSERT ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.incrementVotes();

CREATE TRIGGER decVotes 
BEFORE DELETE ON askfeup.voto
FOR EACH ROW EXECUTE PROCEDURE askfeup.decrementVotes();

/** AskFEUP **/
/** Queries **/

/** 1. Lista de perguntas ordenadas por pontuação (Testado) **/
drop view if exists askfeup.perguntasporpontuacao;
create view askfeup.perguntasporpontuacao as
SELECT pergunta.perguntaid AS id, pergunta.texto AS conteudo, membro.primeironome AS membro, contribuicao.diferencavotos AS pontuacao
   FROM askfeup.pergunta, askfeup.contribuicao, askfeup.membro
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid AND contribuicao.membroid = membro.membroid
  ORDER BY contribuicao.diferencavotos DESC;

/** 2. Lista de perguntas por utilizador (em que tenha actividade e não só as próprias) **/
drop view if exists askfeup.perguntasporutilizador;
create view askfeup.perguntasporutilizador as
SELECT utilizador.username AS "user", pergunta.perguntaid AS id, pergunta.texto AS conteudo
   FROM askfeup.utilizador, askfeup.pergunta, askfeup.membro, askfeup.comentario, askfeup.resposta, askfeup.contribuicao
  WHERE (pergunta.perguntaid = contribuicao.contribuicaoid AND contribuicao.membroid = utilizador.utilizadorid)
    OR
        (resposta.perguntaid = pergunta.perguntaid AND resposta.respostaid = contribuicao.contribuicaoid AND contribuicao.membroid = utilizador.utilizadorid)
  GROUP BY pergunta.perguntaid, utilizador.utilizadorid, pergunta.texto
  ORDER BY utilizador.username;

/** 3. Lista de Pergunta Favoritas por Utilizador **/
drop view if exists askfeup.favoritasporutilizador;
create view askfeup.favoritasporutilizador as
 SELECT membro.ultimonome, membro.primeironome, pergunta.texto, pergunta.descricao
   FROM askfeup.membro
   JOIN askfeup.favorita ON membro.membroid = favorita.membroid
   JOIN askfeup.pergunta ON favorita.perguntaid = pergunta.perguntaid;

/** 4. Lista de Perguntas por Categoria **/
drop view if exists askfeup.perguntasporcategoria;
create view askfeup.perguntasporcategoria as
SELECT pergunta.categoriaid, pergunta.texto, categoria.tipo
   FROM askfeup.pergunta
   JOIN askfeup.categoria ON pergunta.categoriaid = categoria.categoriaid
   ORDER BY pergunta.categoriaid;

/** 5. Lista de Perguntas por Tags**/
drop view if exists askfeup.perguntasportags;
CREATE VIEW askfeup.perguntasportags AS
SELECT tag.nome, pergunta.texto
   FROM askfeup.perguntatag
   JOIN askfeup.tag ON perguntatag.tagid = tag.tagid
   JOIN askfeup.pergunta ON perguntatag.perguntaid = pergunta.perguntaid
   ORDER BY pergunta.texto;

/** 6. Lista de Respostas assinaladas como Correctas**/
drop view if exists askfeup.respostascorrectas;
create view askfeup.respostascorrectas as
SELECT pergunta.perguntaid, pergunta.texto
   FROM askfeup.pergunta
   JOIN askfeup.resposta ON pergunta.perguntaid = resposta.perguntaid
  WHERE resposta.correcta = true
  ORDER BY pergunta.perguntaid;

/** 7. Lista de Respostas dadas por um membro**/
drop view if exists askfeup.respostaspormembro;
CREATE VIEW askfeup.respostaspormembro AS
SELECT resposta.correcta, resposta.descricao
   FROM askfeup.membro
   JOIN askfeup.contribuicao ON membro.membroid = contribuicao.membroid
   JOIN askfeup.resposta ON contribuicao.contribuicaoid = resposta.respostaid;

/** 8. Lista de respostas a uma pergunta **/
drop view if exists askfeup.respostasapergunta;
create view askfeup.respostasapergunta as
SELECT resposta.respostaid as ID, utilizador.username as User, resposta.descricao as Resposta, pergunta.texto as Pergunta
   FROM askfeup.resposta, askfeup.pergunta, askfeup.utilizador, askfeup.contribuicao
  WHERE pergunta.perguntaid = resposta.perguntaid
  AND resposta.respostaid = contribuicao.contribuicaoid
  AND contribuicao.membroid = utilizador.utilizadorid
  ORDER BY pergunta.texto;

/** 9. Lista de comentários a uma contribuição **/
drop view if exists askfeup.comentariosdecontribuicao;
create view askfeup.comentariosdecontribuicao as
SELECT contribuicao.contribuicaoid, comentario.comentarioid, comentario.descricao
   FROM askfeup.contribuicao, askfeup.comentario
  WHERE comentario.contribuicaoid = contribuicao.contribuicaoid
  ORDER BY contribuicao.contribuicaoid;

/** 10. Lista de utilizadores que possuem um determinado Badge (vice-versa) (testado) **/
drop view if exists askfeup.utilizadoresbadge;
create view askfeup.utilizadoresbadge as
SELECT badge.nome, membro.primeironome AS membro
   FROM askfeup.membro, askfeup.badge, askfeup.badgemembro
  WHERE membro.membroid = badgemembro.membroid AND badge.badgeid = badgemembro.badgeid;

/** 11. Lista de perguntas ordenadas por data de criação **/
drop view if exists askfeup.perguntaspordatadecriacao;
CREATE VIEW askfeup.perguntaspordatadecriacao AS
 SELECT pergunta.perguntaid, pergunta.texto
   FROM askfeup.pergunta, askfeup.contribuicao
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid
  ORDER BY contribuicao.data;

/** 12. Lista de perguntas mais populares (votos) **/
drop view if exists askfeup.perguntaspopulares;
create view askfeup.perguntaspopulares as
SELECT pergunta.perguntaid, pergunta.texto, (contribuicao.votospositivos + contribuicao.votosnegativos) as popularidade
   FROM askfeup.pergunta, askfeup.contribuicao
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid
  ORDER BY contribuicao.votospositivos + contribuicao.votosnegativos DESC;

/** 13. Lista de perguntas mais vistas **/
drop view if exists askfeup.perguntasmaisvistas;
CREATE VIEW askfeup.perguntasmaisvistas AS
SELECT pergunta.perguntaid, pergunta.texto, subquery1.views
   FROM askfeup.pergunta, askfeup.contribuicao, ( SELECT visualizacao.perguntaid, count(*) AS views
           FROM askfeup.visualizacao
          GROUP BY visualizacao.perguntaid) subquery1
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid AND subquery1.perguntaid = pergunta.perguntaid
  ORDER BY subquery1.views DESC;

    /** AskFEUP **/
/** Insert Data **/

/** Utilizadores **/
/* (id, username, password) */
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'botas', '7d9187aec886a65a920d3b4a2e3eb66c771510255de4f02a1b0c67a1be856c33');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'henrique', '7d9187aec886a65a920d3b4a2e3eb66c771510255de4f02a1b0c67a1be856c33');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'betao', '7d9187aec886a65a920d3b4a2e3eb66c771510255de4f02a1b0c67a1be856c33');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'zoid', '7d9187aec886a65a920d3b4a2e3eb66c771510255de4f02a1b0c67a1be856c33');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'olamundo', 'ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'lbaw1424', '27944092732df96af0311e3e374b751a584e331c2fcf36c24e5b96dd79741c30');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'okapa', '7f835ed0fb65ec1bed9028a601df8afc902166fd6146b0142ebdb3e4f9508a99');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'blackwoman', 'ba5e06efa10045ea235eb7e31778c557f44860068d2696c42faeac591670b845');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'joker', '2002ef78f20c52f749fc58788ffcf230978adc7c25385355110fd68ac484c1d3');
INSERT INTO askfeup.Utilizador VALUES (DEFAULT, 'vanillagirl', 'b932a7b6748b6335e3d4bf6c3bc1ba1e1e94b49a6eea09691f3071a6ef2d7803');

/** Administradores **/
/* (idUtilizador) */
INSERT INTO askfeup.Administrador VALUES (5);
INSERT INTO askfeup.Administrador VALUES (6);

/** Cidades **/
/* (id, nome, codigo-postal) */
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1050);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1070);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1100);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1150);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1170);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1200);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1250);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1300);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1400);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1500);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1600);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1700);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1750);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1800);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1900);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Lisboa', 1990);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4050);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4100);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4150);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4200);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4250);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4300);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto', 4350);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Aveiro', 3800);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Aveiro', 3810);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Beja', 7800);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Braga', 4700);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Braga', 4705);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Braga', 4710);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Braga', 4715);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Bragança', 5300);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Castelo Branco', 6000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3020);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3025);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3030);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3040);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Coimbra', 3045);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Évora', 7000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Évora', 7005);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Faro', 8000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Faro', 8805);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Funchal', 9000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Funchal', 9020);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Funchal', 9030);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Funchal', 9050);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Guarda', 6300);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Leiria', 2400);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Leiria', 2405);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Leiria', 2410);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Leiria', 2415);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Leiria', 2420);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Ponte Delgada', 9500);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Portalegre', 7300);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Santarém', 2000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Santarém', 2005);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Setúbal', 2900);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Setúbal', 2910);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Viana do Castelo', 4900);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Vila Real', 5000);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Viseu', 3500);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Viseu', 3505);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Viseu', 3510);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Viseu', 3515);
INSERT INTO askfeup.Cidade VALUES (DEFAULT, 'Porto Santo', 9400);

/** Membros **/
/* (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, utilizadorID, cidadeID) */
INSERT INTO askfeup.Membro VALUES ('true', 'João', 'Pereira', 'ei12023@fe.up.pt', DEFAULT, '2015-04-13 04:14:00', '2015-04-18 04:15:00', 1, 22);
INSERT INTO askfeup.Membro VALUES ('true', 'Henrique', 'Ferrolho', 'ei12079@fe.up.pt', DEFAULT, '2015-04-14 12:05:00', '2015-04-18 00:01:00', 2, 63);
INSERT INTO askfeup.Membro VALUES ('true', 'José', 'Cardoso', 'ei12027@fe.up.pt', DEFAULT, '2015-04-14 15:14:00', '2015-04-18 04:18:00', 3, 18);
INSERT INTO askfeup.Membro VALUES ('true', 'Gabriel', 'Souto', 'ei12087@fe.up.pt', DEFAULT, '2015-04-14 20:14:00', '2015-04-08 04:15:00', 4, 18);
INSERT INTO askfeup.Membro VALUES ('true', 'Tiago', 'Negro', 'okapaman@gmail.com', DEFAULT, '2015-04-16 05:00:21', '2015-04-21 18:33:12', 7, 67);
INSERT INTO askfeup.Membro VALUES ('true', 'Gisela', 'Tosta', 'manteigascompao@hotmail.com', DEFAULT, '2015-04-17 15:02:03', '2015-04-22 00:00:57', 8, 61);
INSERT INTO askfeup.Membro VALUES ('true', 'Jorge', 'Castro', 'jorgecastro4@sapo.pt', DEFAULT, '2015-04-18 12:13:43', '2015-04-18 12:13:43', 9, 55);
INSERT INTO askfeup.Membro VALUES ('true', 'Alice', 'Correia', 'lice_correia94@gmail.com', DEFAULT, '2015-04-18 14:13:43', '2015-04-18 19:13:43', 10, 38);

/** Categorias **/
/* (id, tipo) */
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Lazer');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Desporto');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Emprego');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Comida');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Informática');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Programação');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Metalúrgica');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Cívil');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Eletrotécnica');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Associação de Estudantes');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Mestrados');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Doutoramentos');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Gestão');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Indústra');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Diversão Nocturna');
INSERT INTO askfeup.Categoria VALUES (DEFAULT, 'Localizações');

/** Contribuições **/
/* (id, data, diferancaVotos, votosNegativos, votosPositivos, membroID) */
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:33:40', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:34:10', 0, 0, 0, 3);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:34:30', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:39:03', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:45:12', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:50:46', 0, 0, 0, 2);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:51:00', 0, 0, 0, 10);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:59:12', 0, 0, 0, 9);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-17 00:10:56', 0, 0, 0, 2);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 15:11:02', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 14:10:22', 0, 0, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 16:30:45', 0, 0, 0, 3);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 17:01:12', 0, 0, 0, 7);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 18:31:47', 0, 0, 0, 9);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:41:23', 0, 0, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:46:32', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:48:11', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:50:22', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:55:55', 0, 0, 0, 1);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 08:41:23', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 09:10:32', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 10:48:11', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 10:50:22', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 11:55:55', 0, 0, 0, 7);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 14:05:32', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 15:45:21', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 15:56:02', 0, 0, 0, 10);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:12:32', 0, 0, 0, 10);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:14:38', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:15:32', 0, 0, 0, 1);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:00:01', 0, 0, 0, 9);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:02:45', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:02:46', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 13:03:57', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 13:06:00', 0, 0, 0, 4);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 11:45:23', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 13:56:12', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 14:33:03', 0, 0, 0, 4);

/** Perguntas **/
/* (contribuicaoID, texto, descrição, categoriaID) */
INSERT INTO askfeup.Pergunta VALUES (1, 'A Dª. Beatriz vende gomas?', 'Apetecia-me bastante comer gomas mas os únicos sítios que sei estão longe.', 4);

INSERT INTO askfeup.Pergunta VALUES (4, 'O Pavilhão Luís de Falcão dá para reservar?', 'Tenho um grupo de amigos e queriamos jogar à bola.', 2);

INSERT INTO askfeup.Pergunta VALUES (8, 'Quando é o próximo FEUPCaffe?', 'Ouvi dizer que vai um Dj famoso :D', 15);

INSERT INTO askfeup.Pergunta VALUES (11, 'Alguém já usou Laravel?', 'Queria saber se é bom ou não utilizar esta framework.', 6);

INSERT INTO askfeup.Pergunta VALUES (14, 'Quando é o próximo teste de Betão?', 'Não consigo entrar no sigarra, deve estar em baixo o sistema.', 8);

INSERT INTO askfeup.Pergunta VALUES (16, 'Alguém me pode dizer refeições rápidas para trazer para a faculdade para poupar dinheiro?', 'Quero poupar dinheiro para a Queima das Fitas :)', 4);

INSERT INTO askfeup.Pergunta VALUES (21, 'Quais os eventos que decorreram na feup nos próximos dias?', 'Gostaria de participar em pelo menos num.', 1);

INSERT INTO askfeup.Pergunta VALUES (26, 'Olá, onde posso actualizar o ano no meu cartao da FEUP?', '', 16);

INSERT INTO askfeup.Pergunta VALUES (29, 'Como faço para entrar para a AE?', 'É preciso convite?', 10);

INSERT INTO askfeup.Pergunta VALUES (32, 'Tenho um website que preciso de fazer, alguem interessado?', 'Há remunerações de 200 € :)', 6);

INSERT INTO askfeup.Pergunta VALUES (37, 'Existe transporte para o queimódromo a arrancar da FEUP?', 'Já agora que paragens perto do Campus existem...', 15);

/** Respostas **/
/* (contribuicaoID, correcta, descricao, perguntaID) */
INSERT INTO askfeup.Resposta VALUES (2, 'false', 'Nao vende.', 1);
INSERT INTO askfeup.Resposta VALUES (3, 'true', 'LOL. Vende sim. Abre das 9:00h ao 12:00h e das 13:30h às 19:00h', 1);

INSERT INTO askfeup.Resposta VALUES (5, 'false', 'Acho que não dá para reservar @zoid', 4);
INSERT INTO askfeup.Resposta VALUES (6, 'true', 'Dá para reservares mas tens de pagar. Aqui tens o link http://sigarra.up.pt/cdup/pt/web_base.gera_pagina?P_pagina=1026026', 4);
INSERT INTO askfeup.Resposta VALUES (7, 'false', '@zoid precisas de pessoas para jogar? Tou a precisar de fazer desporto, tou gordo.', 4);

INSERT INTO askfeup.Resposta VALUES (9, 'false', 'Acho que não va haver mais este ano. Ta a chegar a queima e nao devem fazer mais para se organizarem', 8);
INSERT INTO askfeup.Resposta VALUES (10, 'true', '@vanillagirl é esta Quinta-feira que vem, dia 23, o Mega FEUPCaffe, vai ser a despedida', 8);

INSERT INTO askfeup.Resposta VALUES (12, 'false', 'Sim, eu não gostei, faz tudo por ti.', 11);
INSERT INTO askfeup.Resposta VALUES (13, 'false', 'Sim já usei, laravel é muito bom, poupas imenso tempo a fazer coisas que sem a framework demoravas horas. Podes dipensar mais tempo a melhorar outras componentes.', 11);

INSERT INTO askfeup.Resposta VALUES (15, 'true', 'Dia 28 de Abril, às 9:00h nas salas B232, B208 e B104', 14);

INSERT INTO askfeup.Resposta VALUES (17, 'false', 'Cozido à Portuguesa e eu como também :)', 16);
INSERT INTO askfeup.Resposta VALUES (18, 'false', 'whisky-cola ? kkkk', 16);
INSERT INTO askfeup.Resposta VALUES (19, 'false', 'torta de morango, eu gosto xD', 16);
INSERT INTO askfeup.Resposta VALUES (20, 'true', 'Panados com arroz é fácil, uma batata cozida com atum. Tens muita coisa desta na net.', 16);

INSERT INTO askfeup.Resposta VALUES (22, 'false', 'Palestra de Limpeza no NI aka Núcleo de Informática', 21);
INSERT INTO askfeup.Resposta VALUES (23, 'false', 'jobIT15 nos Queijos', 21);
INSERT INTO askfeup.Resposta VALUES (24, 'true', 'Desmarca-te da JuniFEUP', 21);
INSERT INTO askfeup.Resposta VALUES (25, 'false', 'Corrida de carros de rolamentos na descida do INESC', 21);

INSERT INTO askfeup.Resposta VALUES (27, 'true', 'No CICA, ao lado do DEI (Departamento de Informática) :)', 26);
INSERT INTO askfeup.Resposta VALUES (28, 'false', 'Penso que vale mais a pena fazeres a transição para o cartao da UP agora que estão em indicios de mudança.', 26);

INSERT INTO askfeup.Resposta VALUES (30, 'true', 'Não apenas tens de pertencer a uma lista :)', 29);
INSERT INTO askfeup.Resposta VALUES (31, 'false', 'Fazendo uma lista xD lol', 29);

INSERT INTO askfeup.Resposta VALUES (33, 'false', 'Eu ! :D', 32);
INSERT INTO askfeup.Resposta VALUES (34, 'false', 'Faço por 150€ :D', 32);
INSERT INTO askfeup.Resposta VALUES (35, 'false', 'Faço por 150€ também e ainda te pago um bolo na cafetaria xD', 32);
INSERT INTO askfeup.Resposta VALUES (36, 'true', 'Faço te de borla e em uma semana :)', 32);

INSERT INTO askfeup.Resposta VALUES (38, 'true', 'Sim há, fica na entrada que la passam autocarros', 37);
INSERT INTO askfeup.Resposta VALUES (39, 'false', 'Na estrada da circunvalaçao passam em várias paragens, nao te sei agora é dizer quais mas são as que ficam paralelas ao campus', 37);

/** Comentários **/
/* (id, data, decricao, contribuicaoID, membroID) */
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-15 22:35:10', 'o @henrique tem razão, mas acho que é às 19:30h que fecha.', 3, 4);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-16 23:44:33', '@botas tem de dar, todos os pavilhoes permitem isso.', 5, 3);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-16 23:50:10', 'obrigado @betao já reservei :)', 6, 4);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-16 23:59:50', '@henrique podes vir :)', 7, 4);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-17 00:05:01', '@joker estas errado, ha sempre um para a despedida', 9, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-17 00:11:41', '@henrique obrigado pela informaçao. É que eu este ano ainda não pude ir nenhuma vez e ia ficar triste se não houvesse mais :(', 10, 10);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-17 00:12:12', '@vanillagirl de nada sempre as ordens. Diverte te na quinta :D', 10, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-17 01:03:45', 'vamos partir tudo !!! :D FEUPCaffe <3', 10, 7);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-18 16:25:00', 'Nao respondeste à questao colocada. E vale muito a pena, tu é que não das valor ou nao a sabes usar :p', 12, 3);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-18 19:49:31', 'LOL @betao, eu quero comer nao beber xD', 18, 8);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-18 19:55:31', '@zoid deixa de ser goloso. Alem de que isso dá muito trabalho :D', 19, 8);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-18 19:57:50', 'obrigado @botas, vou pesquisar, mas estava com muita preguiça xD', 20, 8);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:00:00', 'vou optar por esta, obrigado', 24, 4);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:05:46', 'LOL vou vos acusar malandros kkkkk', 25, 1);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:00:00', 'obrigado @henrique', 27, 3);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:05:46', 'tambem já ouvi falar nisso mas foram so rumores', 28, 3);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:06:59', 'vai a secretaria da FEUP e fala lá :)', 28, 10);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-19 11:07:30', 'vou fazer isso depois entao @vanillagirl :)', 28, 3);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 10:15:15', 'envia me email que eu vou fazer uma lista, se quiseres entrar :)', 29, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 10:15:50', 'e ganhando as eleiçoes nao xD ?', 31, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 10:16:43', 'obvio né xD ?', 31, 1);

INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 12:03:43', 'Isso não vale @henrique, baixando o preço obvio que ficas com o trabalho', 34, 1);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 12:04:34', 'Na guerra vale tudo sorry!', 34, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 12:05:02', 'Fico-me pelos 150€ tambem @joker', 34, 1);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:04:54', '@betao a oferecer bolos tambem eu!', 35, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:05:43', '@henrique podes falar!', 35, 1);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:06:43', 'rime @zoid', 36, 1);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:07:12', '@zoid da te um tiro', 36, 2);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:07:56', 'FOI MARA', 36, 3);
INSERT INTO askfeup.Comentario VALUES (DEFAULT, '2015-04-20 13:07:56', 'Cada um faz aquilo que pode @botas, @henrique e @betao', 36, 4);

/** Tags **/
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'd.beatriz');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'gomas');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'fome');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'pavilhao');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'horario');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'futebol');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'musica');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'noite');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'diversao');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'php');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'web');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'laravel');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'facil');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'comida');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'poupança');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'palestras');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'conhecimento');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'aprender');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'cartaofeup');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'actualizar');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'ae');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'website');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'trabalho');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'dinheiro');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'transporte');
INSERT INTO askfeup.Tag VALUES (DEFAULT, 'queima');

/** PerguntaTag **/
/* (idTag, idPergunta) */
INSERT INTO askfeup.PerguntaTag	VALUES (1, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (2, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 1);

INSERT INTO askfeup.PerguntaTag	VALUES (4, 4);
INSERT INTO askfeup.PerguntaTag	VALUES (5, 4);
INSERT INTO askfeup.PerguntaTag	VALUES (6, 4);

INSERT INTO askfeup.PerguntaTag	VALUES (7, 8);
INSERT INTO askfeup.PerguntaTag	VALUES (8, 8);
INSERT INTO askfeup.PerguntaTag	VALUES (9, 8);

INSERT INTO askfeup.PerguntaTag	VALUES (10, 11);
INSERT INTO askfeup.PerguntaTag	VALUES (11, 11);
INSERT INTO askfeup.PerguntaTag	VALUES (12, 11);

INSERT INTO askfeup.PerguntaTag	VALUES (3, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (13, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (14, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (15, 16);

INSERT INTO askfeup.PerguntaTag	VALUES (16, 21);
INSERT INTO askfeup.PerguntaTag	VALUES (17, 21);
INSERT INTO askfeup.PerguntaTag	VALUES (18, 21);

INSERT INTO askfeup.PerguntaTag	VALUES (19, 26);
INSERT INTO askfeup.PerguntaTag	VALUES (20, 26);

INSERT INTO askfeup.PerguntaTag	VALUES (21, 29);

INSERT INTO askfeup.PerguntaTag	VALUES (22, 32);
INSERT INTO askfeup.PerguntaTag	VALUES (23, 32);
INSERT INTO askfeup.PerguntaTag	VALUES (24, 32);

INSERT INTO askfeup.PerguntaTag	VALUES (25, 37);
INSERT INTO askfeup.PerguntaTag	VALUES (26, 37);

/** Badges **/
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Primeira Dúvida', 'Faz uma pergunta!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Curioso', 'Fizeste 10 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Questionador', 'Fizeste 50 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Rei das Perguntas', 'Fizeste 100 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Boa resposta', 'Respondeste correctamente a uma pergunta!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Atencioso', 'Respondeste correctamente a 10 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Culto', 'Respondeste correctamente a 50 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Sábio', 'Respondeste correctamente a 100 perguntas!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Primeiro Comentário', 'Fizeste um comentário!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Crítico', 'Fizeste 10 comentários!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Chato', 'Fizeste 50 comentários!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Morre', 'Fizeste 100 comentários!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Primeiro Voto', 'Boa, votaste!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Participativo', 'Fizeste 10 votos!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Avaliador', 'Fizeste 50 votos!');
INSERT INTO askfeup.Badge VALUES (DEFAULT, 'Eleitor', 'Fizeste 100 votos!');

/** BadgeMembro **/
/* (membroID, badgeID) */

/** Favoritas **/
/* (membroid, perguntaid) */
INSERT INTO askfeup.Favorita VALUES (1, 4);
INSERT INTO askfeup.Favorita VALUES (1, 8);
INSERT INTO askfeup.Favorita VALUES (2, 11);
INSERT INTO askfeup.Favorita VALUES (2, 29);

INSERT INTO askfeup.Favorita VALUES (2, 1);
INSERT INTO askfeup.Favorita VALUES (2, 8);
INSERT INTO askfeup.Favorita VALUES (2, 16);
INSERT INTO askfeup.Favorita VALUES (2, 37);

INSERT INTO askfeup.Favorita VALUES (3, 11);
INSERT INTO askfeup.Favorita VALUES (3, 26);
INSERT INTO askfeup.Favorita VALUES (3, 29);

INSERT INTO askfeup.Favorita VALUES (4, 1);
INSERT INTO askfeup.Favorita VALUES (4, 8);
INSERT INTO askfeup.Favorita VALUES (4, 29);

INSERT INTO askfeup.Favorita VALUES (7, 37);

INSERT INTO askfeup.Favorita VALUES (8, 26);

INSERT INTO askfeup.Favorita VALUES (9, 4);
INSERT INTO askfeup.Favorita VALUES (9, 16);

INSERT INTO askfeup.Favorita VALUES (10, 1);
INSERT INTO askfeup.Favorita VALUES (10, 4);
INSERT INTO askfeup.Favorita VALUES (10, 8);
INSERT INTO askfeup.Favorita VALUES (10, 11);

/** Notificações **/
INSERT INTO askfeup.Notificacao VALUES (DEFAULT, 1, 1);
INSERT INTO askfeup.Notificacao VALUES (DEFAULT, 1, 2);

/** Votos **/
/* (positivo, idMembro, idContribuiçao */

/* Pergunta 1 */
INSERT INTO askfeup.Voto VALUES ('true', 2, 1);
INSERT INTO askfeup.Voto VALUES ('true', 3, 1);
INSERT INTO askfeup.Voto VALUES ('true', 4, 1);
INSERT INTO askfeup.Voto VALUES ('false', 8, 1);

INSERT INTO askfeup.Voto VALUES ('false', 1, 2);
INSERT INTO askfeup.Voto VALUES ('false', 3, 2);
INSERT INTO askfeup.Voto VALUES ('false', 4, 2);

INSERT INTO askfeup.Voto VALUES ('true', 1, 3);
INSERT INTO askfeup.Voto VALUES ('false', 4, 3);

/* Pergunta 2 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 4);
INSERT INTO askfeup.Voto VALUES ('true', 3, 4);
INSERT INTO askfeup.Voto VALUES ('true', 2, 4);
INSERT INTO askfeup.Voto VALUES ('true', 7, 4);
INSERT INTO askfeup.Voto VALUES ('true', 8, 4);
INSERT INTO askfeup.Voto VALUES ('false', 9, 4);
INSERT INTO askfeup.Voto VALUES ('false', 10, 4);

INSERT INTO askfeup.Voto VALUES ('true', 2, 5);
INSERT INTO askfeup.Voto VALUES ('true', 3, 5);
INSERT INTO askfeup.Voto VALUES ('false', 4, 5);
INSERT INTO askfeup.Voto VALUES ('false', 7, 5);
INSERT INTO askfeup.Voto VALUES ('false', 8, 5);

INSERT INTO askfeup.Voto VALUES ('true', 1, 6);
INSERT INTO askfeup.Voto VALUES ('true', 2, 6);
INSERT INTO askfeup.Voto VALUES ('true', 4, 6);
INSERT INTO askfeup.Voto VALUES ('true', 7, 6);
INSERT INTO askfeup.Voto VALUES ('true', 10, 6);

INSERT INTO askfeup.Voto VALUES ('true', 1, 7);
INSERT INTO askfeup.Voto VALUES ('false', 4, 7);

/* Pergunta 3 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 8);
INSERT INTO askfeup.Voto VALUES ('true', 2, 8);
INSERT INTO askfeup.Voto VALUES ('true', 3, 8);
INSERT INTO askfeup.Voto VALUES ('true', 4, 8);
INSERT INTO askfeup.Voto VALUES ('true', 7, 8);
INSERT INTO askfeup.Voto VALUES ('true', 8, 8);

INSERT INTO askfeup.Voto VALUES ('true', 1, 9);
INSERT INTO askfeup.Voto VALUES ('true', 2, 9);
INSERT INTO askfeup.Voto VALUES ('true', 3, 9);
INSERT INTO askfeup.Voto VALUES ('true', 4, 9);

INSERT INTO askfeup.Voto VALUES ('true', 1, 10);
INSERT INTO askfeup.Voto VALUES ('true', 3, 10);
INSERT INTO askfeup.Voto VALUES ('true', 4, 10);
INSERT INTO askfeup.Voto VALUES ('true', 7, 10);
INSERT INTO askfeup.Voto VALUES ('true', 8, 10);
INSERT INTO askfeup.Voto VALUES ('true', 9, 10);
INSERT INTO askfeup.Voto VALUES ('false', 10, 10);

/* Pergunta 4 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 11);
INSERT INTO askfeup.Voto VALUES ('true', 3, 11);
INSERT INTO askfeup.Voto VALUES ('true', 4, 11);
INSERT INTO askfeup.Voto VALUES ('true', 7, 11);
INSERT INTO askfeup.Voto VALUES ('false', 8, 11);
INSERT INTO askfeup.Voto VALUES ('false', 9, 11);

INSERT INTO askfeup.Voto VALUES ('false', 10, 12);
INSERT INTO askfeup.Voto VALUES ('false', 9, 12);
INSERT INTO askfeup.Voto VALUES ('false', 1, 12);

INSERT INTO askfeup.Voto VALUES ('true', 1, 13);
INSERT INTO askfeup.Voto VALUES ('true', 2, 13);
INSERT INTO askfeup.Voto VALUES ('true', 7, 13);
INSERT INTO askfeup.Voto VALUES ('true', 8, 13);

/* Pergunta 5 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 14);
INSERT INTO askfeup.Voto VALUES ('true', 2, 14);

INSERT INTO askfeup.Voto VALUES ('true', 7, 15);
INSERT INTO askfeup.Voto VALUES ('true', 8, 15);
INSERT INTO askfeup.Voto VALUES ('true', 10, 15);

/* Pergunta 6 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 16);
INSERT INTO askfeup.Voto VALUES ('true', 2, 16);
INSERT INTO askfeup.Voto VALUES ('true', 3, 16);
INSERT INTO askfeup.Voto VALUES ('true', 4, 16);
INSERT INTO askfeup.Voto VALUES ('true', 7, 16);
INSERT INTO askfeup.Voto VALUES ('false', 10, 16);

INSERT INTO askfeup.Voto VALUES ('false', 1, 17);
INSERT INTO askfeup.Voto VALUES ('false', 3, 17);
INSERT INTO askfeup.Voto VALUES ('false', 4, 17);
INSERT INTO askfeup.Voto VALUES ('false', 8, 17);
INSERT INTO askfeup.Voto VALUES ('true', 9, 17);

INSERT INTO askfeup.Voto VALUES ('false', 1, 18);
INSERT INTO askfeup.Voto VALUES ('false', 2, 18);
INSERT INTO askfeup.Voto VALUES ('false', 4, 18);
INSERT INTO askfeup.Voto VALUES ('false', 7, 18);

INSERT INTO askfeup.Voto VALUES ('true', 1, 19);
INSERT INTO askfeup.Voto VALUES ('true', 2, 19);
INSERT INTO askfeup.Voto VALUES ('false', 3, 19);
INSERT INTO askfeup.Voto VALUES ('false', 7, 19);
INSERT INTO askfeup.Voto VALUES ('false', 8, 19);
INSERT INTO askfeup.Voto VALUES ('false', 9, 19);
INSERT INTO askfeup.Voto VALUES ('false', 10, 19);

INSERT INTO askfeup.Voto VALUES ('true', 2, 20);
INSERT INTO askfeup.Voto VALUES ('true', 3, 20);
INSERT INTO askfeup.Voto VALUES ('true', 4, 20);
INSERT INTO askfeup.Voto VALUES ('true', 8, 20);
INSERT INTO askfeup.Voto VALUES ('true', 7, 20);

/* Pergunta 7 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 21);
INSERT INTO askfeup.Voto VALUES ('true', 2, 21);
INSERT INTO askfeup.Voto VALUES ('true', 3, 21);
INSERT INTO askfeup.Voto VALUES ('true', 8, 21);
INSERT INTO askfeup.Voto VALUES ('true', 9, 21);

INSERT INTO askfeup.Voto VALUES ('true', 1, 22);
INSERT INTO askfeup.Voto VALUES ('true', 3, 22);
INSERT INTO askfeup.Voto VALUES ('true', 4, 22);

INSERT INTO askfeup.Voto VALUES ('true', 1, 23);
INSERT INTO askfeup.Voto VALUES ('true', 2, 23);

INSERT INTO askfeup.Voto VALUES ('true', 8, 24);

INSERT INTO askfeup.Voto VALUES ('true', 1, 25);
INSERT INTO askfeup.Voto VALUES ('true', 2, 25);
INSERT INTO askfeup.Voto VALUES ('false', 8, 25);
INSERT INTO askfeup.Voto VALUES ('false', 9, 25);
INSERT INTO askfeup.Voto VALUES ('false', 10, 25);

/* Pergunta 8 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 26);
INSERT INTO askfeup.Voto VALUES ('true', 2, 26);
INSERT INTO askfeup.Voto VALUES ('true', 4, 26);
INSERT INTO askfeup.Voto VALUES ('false', 9, 26);
INSERT INTO askfeup.Voto VALUES ('false', 10, 26);

INSERT INTO askfeup.Voto VALUES ('false', 1, 27);
INSERT INTO askfeup.Voto VALUES ('true', 9, 27);
INSERT INTO askfeup.Voto VALUES ('true', 8, 27);
INSERT INTO askfeup.Voto VALUES ('true', 10, 27);
INSERT INTO askfeup.Voto VALUES ('true', 3, 27);

INSERT INTO askfeup.Voto VALUES ('true', 1, 28);
INSERT INTO askfeup.Voto VALUES ('false', 2, 28);

/* Pergunta 9 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 29);
INSERT INTO askfeup.Voto VALUES ('true', 2, 29);
INSERT INTO askfeup.Voto VALUES ('true', 3, 29);

INSERT INTO askfeup.Voto VALUES ('true', 1, 30);
INSERT INTO askfeup.Voto VALUES ('true', 3, 30);
INSERT INTO askfeup.Voto VALUES ('true', 4, 30);

INSERT INTO askfeup.Voto VALUES ('true', 2, 31);
INSERT INTO askfeup.Voto VALUES ('false', 3, 31);

/* Pergunta 10 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 32);
INSERT INTO askfeup.Voto VALUES ('true', 2, 32);
INSERT INTO askfeup.Voto VALUES ('true', 3, 32);
INSERT INTO askfeup.Voto VALUES ('true', 4, 32);
INSERT INTO askfeup.Voto VALUES ('true', 7, 32);
INSERT INTO askfeup.Voto VALUES ('true', 8, 32);
INSERT INTO askfeup.Voto VALUES ('false', 10, 32);

INSERT INTO askfeup.Voto VALUES ('true', 9, 33);

INSERT INTO askfeup.Voto VALUES ('true', 9, 34);

INSERT INTO askfeup.Voto VALUES ('true', 9, 35);

INSERT INTO askfeup.Voto VALUES ('true', 9, 36);
INSERT INTO askfeup.Voto VALUES ('false', 1, 36);
INSERT INTO askfeup.Voto VALUES ('false', 2, 36);
INSERT INTO askfeup.Voto VALUES ('false', 3, 36);

/* Pergunta 11 */
INSERT INTO askfeup.Voto VALUES ('true', 2, 37);
INSERT INTO askfeup.Voto VALUES ('true', 3, 37);
INSERT INTO askfeup.Voto VALUES ('true', 4, 37);

INSERT INTO askfeup.Voto VALUES ('true', 1, 38);
INSERT INTO askfeup.Voto VALUES ('true', 3, 38);
INSERT INTO askfeup.Voto VALUES ('true', 4, 38);

INSERT INTO askfeup.Voto VALUES ('true', 1, 39);
INSERT INTO askfeup.Voto VALUES ('true', 2, 39);
INSERT INTO askfeup.Voto VALUES ('true', 3, 39);

/** Recuperações de Password **/
/* (id, codigo, data, membro) */
INSERT INTO askfeup.RecuperacaoDePassword VALUES (DEFAULT, 'umastringdepass', '2015-04-29 22:32:00', 1);
INSERT INTO askfeup.RecuperacaoDePassword VALUES (DEFAULT, 'blablabla', '2015-04-30 01:54:00', 2);

/** Visualizações **/
/* (membroID, perguntaID) */
/* Pergunta 1 */
INSERT INTO askfeup.Visualizacao VALUES (2, 1);
INSERT INTO askfeup.Visualizacao VALUES (3, 1);
INSERT INTO askfeup.Visualizacao VALUES (4, 1);
INSERT INTO askfeup.Visualizacao VALUES (8, 1);

/* Pergunta 2 */
INSERT INTO askfeup.Visualizacao VALUES (1, 4);
INSERT INTO askfeup.Visualizacao VALUES (2, 4);
INSERT INTO askfeup.Visualizacao VALUES (3, 4);
INSERT INTO askfeup.Visualizacao VALUES (7, 4);
INSERT INTO askfeup.Visualizacao VALUES (8, 4);
INSERT INTO askfeup.Visualizacao VALUES (9, 4);
INSERT INTO askfeup.Visualizacao VALUES (10, 4);

/* Pergunta 3 */
INSERT INTO askfeup.Visualizacao VALUES (1, 8);
INSERT INTO askfeup.Visualizacao VALUES (2, 8);
INSERT INTO askfeup.Visualizacao VALUES (3, 8);
INSERT INTO askfeup.Visualizacao VALUES (4, 8);
INSERT INTO askfeup.Visualizacao VALUES (7, 8);
INSERT INTO askfeup.Visualizacao VALUES (8, 8);
INSERT INTO askfeup.Visualizacao VALUES (9, 8);

/* Pergunta 4 */
INSERT INTO askfeup.Visualizacao VALUES (1, 11);
INSERT INTO askfeup.Visualizacao VALUES (3, 11);
INSERT INTO askfeup.Visualizacao VALUES (4, 11);
INSERT INTO askfeup.Visualizacao VALUES (7, 11);
INSERT INTO askfeup.Visualizacao VALUES (8, 11);
INSERT INTO askfeup.Visualizacao VALUES (9, 11);
INSERT INTO askfeup.Visualizacao VALUES (10, 11);

/* Pergunta 5 */
INSERT INTO askfeup.Visualizacao VALUES (1, 14);
INSERT INTO askfeup.Visualizacao VALUES (2, 14);
INSERT INTO askfeup.Visualizacao VALUES (8, 14);
INSERT INTO askfeup.Visualizacao VALUES (9, 14);
INSERT INTO askfeup.Visualizacao VALUES (10, 14);

/* Pergunta 6 */
INSERT INTO askfeup.Visualizacao VALUES (1, 16);
INSERT INTO askfeup.Visualizacao VALUES (2, 16);
INSERT INTO askfeup.Visualizacao VALUES (3, 16);
INSERT INTO askfeup.Visualizacao VALUES (4, 16);
INSERT INTO askfeup.Visualizacao VALUES (7, 16);
INSERT INTO askfeup.Visualizacao VALUES (9, 16);
INSERT INTO askfeup.Visualizacao VALUES (10, 16);

/* Pergunta 7 */
INSERT INTO askfeup.Visualizacao VALUES (1, 21);
INSERT INTO askfeup.Visualizacao VALUES (2, 21);
INSERT INTO askfeup.Visualizacao VALUES (3, 21);
INSERT INTO askfeup.Visualizacao VALUES (7, 21);
INSERT INTO askfeup.Visualizacao VALUES (8, 21);
INSERT INTO askfeup.Visualizacao VALUES (9, 21);
INSERT INTO askfeup.Visualizacao VALUES (10, 21);

/* Pergunta 8 */
INSERT INTO askfeup.Visualizacao VALUES (1, 26);
INSERT INTO askfeup.Visualizacao VALUES (2, 26);
INSERT INTO askfeup.Visualizacao VALUES (4, 26);
INSERT INTO askfeup.Visualizacao VALUES (7, 26);
INSERT INTO askfeup.Visualizacao VALUES (8, 26);
INSERT INTO askfeup.Visualizacao VALUES (9, 26);
INSERT INTO askfeup.Visualizacao VALUES (10, 26);

/* Pergunta 9 */
INSERT INTO askfeup.Visualizacao VALUES (1, 29);
INSERT INTO askfeup.Visualizacao VALUES (2, 29);
INSERT INTO askfeup.Visualizacao VALUES (3, 29);
INSERT INTO askfeup.Visualizacao VALUES (4, 29);

/* Pergunta 10 */
INSERT INTO askfeup.Visualizacao VALUES (1, 32);
INSERT INTO askfeup.Visualizacao VALUES (2, 32);
INSERT INTO askfeup.Visualizacao VALUES (3, 32);
INSERT INTO askfeup.Visualizacao VALUES (4, 32);
INSERT INTO askfeup.Visualizacao VALUES (7, 32);
INSERT INTO askfeup.Visualizacao VALUES (8, 32);
INSERT INTO askfeup.Visualizacao VALUES (10, 32);

/* Pergunta 11 */
INSERT INTO askfeup.Visualizacao VALUES (2, 37);
INSERT INTO askfeup.Visualizacao VALUES (3, 37);
INSERT INTO askfeup.Visualizacao VALUES (4, 37);
