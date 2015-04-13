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
	FOREIGN KEY (administradorID) REFERENCES askfeup.Utilizador (utilizadorID);

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
	pontos int,
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
	FOREIGN KEY (membroID) REFERENCES askfeup.Utilizador (utilizadorID);

/*-------------- Contribuicao --------------*/

DROP TABLE IF EXISTS askfeup.Contribuicao;
CREATE TABLE IF NOT EXISTS askfeup.Contribuicao (
	contribuicaoID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	diferencaVotos integer,
	votosNegativos integer,
	votosPositivos integer,
	membroID integer NOT NULL
);

ALTER TABLE askfeup.Contribuicao ADD CONSTRAINT PK_Contribuicao PRIMARY KEY (contribuicaoID);

/*-------------- Categoria --------------*/

DROP TABLE IF EXISTS askfeup.Categoria;
CREATE TABLE IF NOT EXISTS askfeup.Categoria (
	categoriaID serial NOT NULL,
	tipo varchar(20) NOT NULL,
	CONSTRAINT UK_Categoria_tipo UNIQUE (tipo)
);

ALTER TABLE askfeup.Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoriaID);

/*-------------- Pergunta --------------*/

DROP TABLE IF EXISTS askfeup.Pergunta;
CREATE TABLE IF NOT EXISTS askfeup.Pergunta ( 
	perguntaID integer NOT NULL,
	texto text NOT NULL,
	descricao text,
	categoriaID integer NOT NULL
);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT PK_Pergunta PRIMARY KEY (perguntaID);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT FK_Pergunta_Categoria 
	FOREIGN KEY (categoriaID) REFERENCES askfeup.Categoria (categoriaID);

ALTER TABLE askfeup.Pergunta ADD CONSTRAINT FK_Pergunta_Contribuicao 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Contribuicao (contribuicaoID);

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
	nome varchar(20) NOT NULL,
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
	membroID integer NOT NULL
);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT PK_Comentario PRIMARY KEY (comentarioID);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT FK_Comentario_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID);

ALTER TABLE askfeup.Comentario ADD CONSTRAINT FK_Comentario_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

/*-------------- Favorita --------------*/

DROP TABLE IF EXISTS askfeup.Favorita;
CREATE TABLE IF NOT EXISTS askfeup.Favorita (
	membroID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askfeup.Favorita ADD CONSTRAINT PK_Favorita PRIMARY KEY (membroID, perguntaID);

ALTER TABLE askfeup.Favorita ADD CONSTRAINT FK_Favorita_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

ALTER TABLE askfeup.Favorita ADD CONSTRAINT FK_Favorita_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID);

/*-------------- BadgeMembro --------------*/

DROP TABLE IF EXISTS askfeup.BadgeMembro;
CREATE TABLE IF NOT EXISTS askfeup.BadgeMembro (
	membroID integer NOT NULL,
	badgeID integer NOT NULL
);

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT PK_BadgeMembro PRIMARY KEY (membroID, badgeID);

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

ALTER TABLE askfeup.BadgeMembro ADD CONSTRAINT Badge 
	FOREIGN KEY (badgeID) REFERENCES askfeup.Badge (badgeID);

/*-------------- PerguntaTag --------------*/

DROP TABLE IF EXISTS askfeup.PerguntaTag;
CREATE TABLE IF NOT EXISTS askfeup.PerguntaTag (
	tagID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT PK_PerguntaTag PRIMARY KEY (perguntaID, tagID);

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Tag
	FOREIGN KEY (tagID) REFERENCES askfeup.Tag (tagID);

ALTER TABLE askfeup.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID);

/*-------------- Notificacao --------------*/

DROP TABLE IF EXISTS askfeup.Notificacao;
CREATE TABLE IF NOT EXISTS askfeup.Notificacao (
	notificacaoID serial NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT PK_Notificacao PRIMARY KEY (notificacaoID);

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT FK_Notificacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

ALTER TABLE askfeup.Notificacao ADD CONSTRAINT FK_Notificacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID);

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
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

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
	FOREIGN KEY (respostaID) REFERENCES askfeup.Contribuicao (contribuicaoID);

ALTER TABLE askfeup.Resposta ADD CONSTRAINT FK_Resposta_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID);

/*-------------- Voto --------------*/

DROP TABLE IF EXISTS askfeup.Voto;
CREATE TABLE IF NOT EXISTS askfeup.Voto (
	positivo boolean,
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE askfeup.Voto ADD CONSTRAINT PK_Voto PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE askfeup.Voto ADD CONSTRAINT FK_Voto_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

ALTER TABLE askfeup.Voto ADD CONSTRAINT FK_Voto_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askfeup.Contribuicao (contribuicaoID);

/*-------------- Visualizacao --------------*/

DROP TABLE IF EXISTS askfeup.Visualizacao;
CREATE TABLE IF NOT EXISTS askfeup.Visualizacao (
	membroID integer NOT NULL,
	PerguntaID integer NOT NULL
);

ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT PK_Visualizacao PRIMARY KEY (membroID, perguntaID);


ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT FK_Visualizacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askfeup.Membro (membroID);

ALTER TABLE askfeup.Visualizacao ADD CONSTRAINT FK_Visualizacao_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askfeup.Pergunta (perguntaID);
