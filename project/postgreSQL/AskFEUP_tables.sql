/** AskFEUP **/
/** Tables **/

.headers ON
.mode columns


CREATE TABLE Contribuição (
	contribuiçãoID integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	data timestamp(0),
	/diferençaVotos int,
	votosNegativos int,
	votosPositivos int
);

CREATE TABLE Pergunta ( 
	perguntaID integer NOT NULL REFERENCES Contribuição(contribuiçãoID),
	descricao varchar(50),
	texto varchar(50),
	categoriaID integer
);

CREATE TABLE Administrador ( 
	administradorID integer NOT NULL
)
;

CREATE TABLE Badge ( 
	descricao varchar(50),
	nome varchar(50),
	badgeID integer NOT NULL
)
;

CREATE TABLE Categoria ( 
	tipo varchar(50),
	categoriaID integer NOT NULL
)
;

CREATE TABLE Cidade ( 
	codigoPostal int,
	nome varchar(50),
	cidadeID integer NOT NULL
)
;

CREATE TABLE Comentário ( 
	data timestamp(0),
	descricao varchar(50),
	comentárioID integer NOT NULL,
	contribuiçãoID integer,
	membroID integer
)
;

CREATE TABLE Favorita ( 
	favoritaID integer NOT NULL,
	membroID integer,
	perguntaID integer
)
;

CREATE TABLE JoinBadgeToMembro ( 
	membroID integer,
	badgeID integer
)
;

CREATE TABLE JoinPerguntaToTag ( 
	tagID integer,
	perguntaID integer
)
;

CREATE TABLE Membro ( 
	activo boolean,
	email varchar(50),
	pontos int,
	registo timestamp(0),
	ultimoLogin timestamp(0),
	membroID integer NOT NULL,
	cidadeID integer
)
;

CREATE TABLE Notificação ( 
	notificaçãoID integer NOT NULL,
	membroID integer,
	contribuiçãoID integer
)
;

CREATE TABLE Recuperação de password ( 
	codigoValidacao varchar(50),
	data timestamp(0),
	recuperação de passwordID integer NOT NULL,
	membroID integer
)
;

CREATE TABLE Resposta ( 
	correcta boolean,
	descricao varchar(50),
	respostaID integer NOT NULL,
	perguntaID integer
)
;

CREATE TABLE Tag ( 
	nome varchar(50),
	tagID integer NOT NULL
)
;

CREATE TABLE Utilizador ( 
	nome varchar(50),
	password varchar(50),
	utilizadorID integer NOT NULL
)
;

CREATE TABLE Voto ( 
	positivo boolean,
	votoID integer NOT NULL,
	membroID integer,
	contribuiçãoID integer
)
;


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
