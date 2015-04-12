/** AskFEUP **/
/** Tables **/

.headers ON
.mode columns

DROP TABLE IF EXISTS Utilizador;
CREATE TABLE IF NOT EXISTS Utilizador (
	utilizadorID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	username text,
	password text
);

DROP TABLE IF EXISTS Administrador;
CREATE TABLE IF NOT EXISTS Administrador ( 
	administradorID integer NOT NULL REFERENCES Utilizador(utilizadorID),
);

DROP TABLE IF EXISTS Contribuicao;
CREATE TABLE IF NOT EXISTS Contribuicao (
	contribuicaoID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	data timestamp,
	diferençaVotos integer,
	votosNegativos integer,
	votosPositivos integer,
	membroID integer NOT NULL REFERENCES Membro(membroID)
);

DROP TABLE IF EXISTS Categoria;
CREATE TABLE IF NOT EXISTS Categoria (
	categoriaID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	tipo varchar(20),
);

DROP TABLE IF EXISTS Pergunta;
CREATE TABLE IF NOT EXISTS Pergunta ( 
	perguntaID integer NOT NULL REFERENCES Contribuição(contribuicaoID),
	texto text,
	descricao text,
	categoriaID integer NOT NULL REFERENCES Categoria(categoriaID)
);

DROP TABLE IF EXISTS Tag;
CREATE TABLE IF NOT EXISTS Tag (
	tagID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	nome varchar(20),
);

DROP TABLE IF EXISTS Badge;
CREATE TABLE IF NOT EXISTS Badge (
	badgeID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	nome varchar(20),
	descricao text
);

DROP TABLE IF EXISTS Cidade;
CREATE TABLE IF NOT EXISTS Cidade (
	cidadeID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	nome varchar(20),
	codigoPostal int
);

DROP TABLE IF EXISTS Membro;
CREATE TABLE IF NOT EXISTS Membro (
	activo boolean,
	primeiroNome varchar(20) NOT NULL,
	ultimoNome varchar(20) NOT NULL,
	email varchar(50),
	pontos int,
	registo timestamp,
	ultimoLogin timestamp,
	membroID integer NOT NULL REFERENCES Membro(membroID),
	cidadeID integer
);

DROP TABLE IF EXISTS Comentario;
CREATE TABLE IF NOT EXISTS Comentario (
	comentarioID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	data timestamp,
	descricao text NOT NULL,
	contribuicaoID integer NOT NULL REFERENCES Contribuicao(contribuicaoID),
	membroID integer NOT NULL REFERENCES Membro(utilizadorID)
);

DROP TABLE IF EXISTS Favorita;
CREATE TABLE IF NOT EXISTS Favorita ( 
	favoritaID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	membroID integer NOT NULL REFERENCES Membro(membroID),
	perguntaID integer NOT NULL REFERENCES Pergunta(perguntaID)
)
;

DROP TABLE IF EXISTS BadgeMembro;
CREATE TABLE IF NOT EXISTS BadgeMembro (
	membroID integer NOT NULL REFERENCES Membro(membroID),
	badgeID integer NOT NULL REFERENCES Badge(badgeID)
);

DROP TABLE IF EXISTS PerguntaTag;
CREATE TABLE IF NOR EXISTS PerguntaTag (
	tagID integer NOT NULL REFERENCES Tag(tagID),
	perguntaID integer NOT NULL REFERENCES Pergunta(perguntaID)
);

DROP TABLE IF EXISTS Notificacao;
CREATE TABLE IF NOT EXISTS Notificacao (
	notificacaoID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	contribuicaoID integer NOT NULL REFERENCES Contribuicao(contribuicaoID),
	membroID integer NOT NULL REFERENCES Membro(membroID)
);

DROP TABLE IF EXISTS RecuperacaoDePassword;
CREATE TABLE IF NOT EXISTS RecuperacaoDePassword (
	recuperacaoDePasswordID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	codigoValidacao varchar(50),
	data timestamp,
	membroID integer NOT NULL REFERENCES Membro(membroID)
);

DROP TABLE IF EXISTS Resposta;
CREATE TABLE IF NOT EXISTS Resposta (
	respostaID integer NOT NULL REFERENCES Contribuicao(contribuicaoID),
	correcta boolean,
	descricao text,
	perguntaID integer NOT NULL REFERENCES Pergunta(perguntaID)
);

DROP TABLE IF EXISTS Voto;
CREATE TABLE IF NOT EXISTS Voto (
	votoID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	positivo boolean,
	membroID integer NOT NULL REFERENCES Membro(membroID),
	contribuicaoID integer NOT NULL REFERENCES Contribuicao(contribuicaoID)
);

/**
ALTER TABLE Administrador ADD CONSTRAINT PK_Administrador 
	PRIMARY KEY (administradorID)
;


ALTER TABLE Badge ADD CONSTRAINT PK_Badge 
	PRIMARY KEY (badgeID)
;


ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria 
	PRIMARY KEY (categoriaID)
;


ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade 
	PRIMARY KEY (cidadeID)
;


ALTER TABLE Comentário ADD CONSTRAINT PK_Comentário 
	PRIMARY KEY (comentárioID)
;


ALTER TABLE Contribuição ADD CONSTRAINT PK_Contribuição 
	PRIMARY KEY (contribuiçãoID)
;


ALTER TABLE Favorita ADD CONSTRAINT PK_Favorita 
	PRIMARY KEY (favoritaID)
;


ALTER TABLE Membro ADD CONSTRAINT PK_Membro 
	PRIMARY KEY (membroID)
;


ALTER TABLE Notificação ADD CONSTRAINT PK_Notificação 
	PRIMARY KEY (notificaçãoID)
;


ALTER TABLE Pergunta ADD CONSTRAINT PK_Pergunta 
	PRIMARY KEY (perguntaID)
;


ALTER TABLE Recuperação de password ADD CONSTRAINT PK_Recuperação de password 
	PRIMARY KEY (recuperação de passwordID)
;


ALTER TABLE Resposta ADD CONSTRAINT PK_Resposta 
	PRIMARY KEY (respostaID)
;


ALTER TABLE Tag ADD CONSTRAINT PK_Tag 
	PRIMARY KEY (tagID)
;


ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador 
	PRIMARY KEY (utilizadorID)
;


ALTER TABLE Voto ADD CONSTRAINT PK_Voto 
	PRIMARY KEY (votoID)
;




ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_Utilizador 
	FOREIGN KEY (administradorID) REFERENCES Utilizador (utilizadorID)
;

ALTER TABLE Comentário ADD CONSTRAINT FK_Comentário_Contribuição 
	FOREIGN KEY (contribuiçãoID) REFERENCES Contribuição (contribuiçãoID)
;

ALTER TABLE Comentário ADD CONSTRAINT FK_Comentário_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID)
;

ALTER TABLE JoinBadgeToMembro ADD CONSTRAINT Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE JoinBadgeToMembro ADD CONSTRAINT Badge 
	FOREIGN KEY (badgeID) REFERENCES Badge (badgeID)
;

ALTER TABLE JoinPerguntaToTag ADD CONSTRAINT Tag 
	FOREIGN KEY (tagID) REFERENCES Tag (tagID)
;

ALTER TABLE JoinPerguntaToTag ADD CONSTRAINT Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID)
;

ALTER TABLE Membro ADD CONSTRAINT FK_Membro_Cidade 
	FOREIGN KEY (cidadeID) REFERENCES Cidade (cidadeID)
;

ALTER TABLE Membro ADD CONSTRAINT FK_Membro_Utilizador 
	FOREIGN KEY (membroID) REFERENCES Utilizador (utilizadorID)
;

ALTER TABLE Notificação ADD CONSTRAINT FK_Notificação_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE Notificação ADD CONSTRAINT FK_Notificação_Contribuição 
	FOREIGN KEY (contribuiçãoID) REFERENCES Contribuição (contribuiçãoID)
;

ALTER TABLE Pergunta ADD CONSTRAINT FK_Pergunta_Categoria 
	FOREIGN KEY (categoriaID) REFERENCES Categoria (categoriaID)
;

ALTER TABLE Pergunta ADD CONSTRAINT FK_Pergunta_Contribuição 
	FOREIGN KEY (perguntaID) REFERENCES Contribuição (contribuiçãoID)
;

ALTER TABLE Recuperação de password ADD CONSTRAINT FK_Recuperação de password_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_Contribuição 
	FOREIGN KEY (respostaID) REFERENCES Contribuição (contribuiçãoID)
;

ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID)
;

ALTER TABLE Voto ADD CONSTRAINT FK_Voto_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID)
;

ALTER TABLE Voto ADD CONSTRAINT FK_Voto_Contribuição 
	FOREIGN KEY (contribuiçãoID) REFERENCES Contribuição (contribuiçãoID)
;

**/
