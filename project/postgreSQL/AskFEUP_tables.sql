/** AskFEUP **/
/** Tables **/

/*-------------- Utilizador --------------*/

DROP TABLE IF EXISTS Utilizador;
CREATE TABLE IF NOT EXISTS Utilizador (
	utilizadorID serial NOT NULL,
	username text NOT NULL,
	password text NOT NULL,
	CONSTRAINT UK_Utilizador_username UNIQUE (username)
);

ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador PRIMARY KEY (utilizadorID);

/*-------------- Administrador --------------*/

DROP TABLE IF EXISTS Administrador;
CREATE TABLE IF NOT EXISTS Administrador ( 
	administradorID integer NOT NULL,
);

ALTER TABLE Administrador ADD CONSTRAINT PK_Administrador PRIMARY KEY (administradorID);

ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_Utilizador
	FOREIGN KEY (administradorID) REFERENCES Utilizador (utilizadorID);

/*-------------- Contribuicao --------------*/

DROP TABLE IF EXISTS Contribuicao;
CREATE TABLE IF NOT EXISTS Contribuicao (
	contribuicaoID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	diferençaVotos integer,
	votosNegativos integer,
	votosPositivos integer,
	membroID integer NOT NULL,
);

ALTER TABLE Contribuicao ADD CONSTRAINT PK_Contribuicao PRIMARY KEY (contribuicaoID);

/*-------------- Categoria --------------*/

DROP TABLE IF EXISTS Categoria;
CREATE TABLE IF NOT EXISTS Categoria (
	categoriaID serial NOT NULL,
	tipo varchar(20) NOT NULL,
	CONSTRAINT UK_Categoria_tipo UNIQUE (tipo)
);

ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoriaID);

/*-------------- Pergunta --------------*/

DROP TABLE IF EXISTS Pergunta;
CREATE TABLE IF NOT EXISTS Pergunta ( 
	perguntaID integer NOT NULL,
	texto text NOT NULL,
	descricao text,
	categoriaID integer NOT NULL
);

ALTER TABLE Pergunta ADD CONSTRAINT PK_Pergunta PRIMARY KEY (perguntaID);

ALTER TABLE Pergunta ADD CONSTRAINT FK_Pergunta_Categoria 
	FOREIGN KEY (categoriaID) REFERENCES Categoria (categoriaID);

ALTER TABLE Pergunta ADD CONSTRAINT FK_Pergunta_Contribuicao 
	FOREIGN KEY (perguntaID) REFERENCES Contribuicao (contribuicaoID);

/*-------------- Tag --------------*/

DROP TABLE IF EXISTS Tag;
CREATE TABLE IF NOT EXISTS Tag (
	tagID serial NOT NULL,
	nome varchar(20) NOT NULL,
	CONSTRAINT UK_Tag_nome UNIQUE (nome)
);

ALTER TABLE Tag ADD CONSTRAINT PK_Tag PRIMARY KEY (tagID);

/*-------------- Badge --------------*/

DROP TABLE IF EXISTS Badge;
CREATE TABLE IF NOT EXISTS Badge (
	badgeID serial NOT NULL,
	nome varchar(20) NOT NULL,
	descricao text,
	CONSTRAINT UK_Badge_nome UNIQUE (nome)
);

ALTER TABLE Badge ADD CONSTRAINT PK_Badge PRIMARY KEY (badgeID);

/*-------------- Cidade --------------*/

DROP TABLE IF EXISTS Cidade;
CREATE TABLE IF NOT EXISTS Cidade (
	cidadeID serial NOT NULL,
	nome varchar(20) NOT NULL,
	codigoPostal int NOT NULL,
	CONSTRAINT UK_Cidade_codigoPostal UNIQUE (codigoPostal)	
);

ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (cidadeID);

/*-------------- Membro --------------*/

DROP TABLE IF EXISTS Membro;
CREATE TABLE IF NOT EXISTS Membro (
	activo boolean,
	primeiroNome varchar(20) NOT NULL,
	ultimoNome varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	pontos int,
	registo timestamp DEFAULT current_timestamp,
	ultimoLogin timestamp NOT NULL,
	membroID integer NOT NULL REFERENCES Membro(membroID),
	cidadeID integer NOT NULL,
	CONSTRAINT UK_Membro_email UNIQUE (email)
);

ALTER TABLE Membro ADD CONSTRAINT PK_Membro PRIMARY KEY (membroID);

ALTER TABLE Membro ADD CONSTRAINT FK_Membro_Cidade 
	FOREIGN KEY (cidadeID) REFERENCES Cidade (cidadeID);

ALTER TABLE Membro ADD CONSTRAINT FK_Membro_Utilizador 
	FOREIGN KEY (membroID) REFERENCES Utilizador (utilizadorID);

/*-------------- Comentario --------------*/

DROP TABLE IF EXISTS Comentario;
CREATE TABLE IF NOT EXISTS Comentario (
	comentarioID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	descricao text NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE Comentario ADD CONSTRAINT PK_Comentario PRIMARY KEY (comentarioID);

ALTER TABLE Comentario ADD CONSTRAINT FK_Comentario_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES Contribuicao (contribuicaoID);

ALTER TABLE Comentario ADD CONSTRAINT FK_Comentario_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

/*-------------- Favorita --------------*/

DROP TABLE IF EXISTS Favorita;
CREATE TABLE IF NOT EXISTS Favorita (
	membroID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE Favorita ADD CONSTRAINT PK_Favorita PRIMARY KEY (membroID, perguntaID);

ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

ALTER TABLE Favorita ADD CONSTRAINT FK_Favorita_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID);

/*-------------- BadgeMembro --------------*/

DROP TABLE IF EXISTS BadgeMembro;
CREATE TABLE IF NOT EXISTS BadgeMembro (
	membroID integer NOT NULL,
	badgeID integer NOT NULL
);

ALTER TABLE BadgeMembro ADD CONSTRAINT PK_BadgeMembro PRIMARY KEY (membroID, badgeID);

ALTER TABLE BadgeMembro ADD CONSTRAINT Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

ALTER TABLE BadgeMembro ADD CONSTRAINT Badge 
	FOREIGN KEY (badgeID) REFERENCES Badge (badgeID);

/*-------------- PerguntaTag --------------*/

DROP TABLE IF EXISTS PerguntaTag;
CREATE TABLE IF NOR EXISTS PerguntaTag (
	tagID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE PerguntaTag ADD CONSTRAINT PK_PerguntaTag PRIMARY KEY (perguntaID, tagID);

ALTER TABLE PerguntaTag ADD CONSTRAINT Tag 
	FOREIGN KEY (tagID) REFERENCES Tag (tagID);

ALTER TABLE PerguntaTag ADD CONSTRAINT Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID);

/*-------------- Notificacao --------------*/

DROP TABLE IF EXISTS Notificacao;
CREATE TABLE IF NOT EXISTS Notificacao (
	notificacaoID serial NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE Notificacao ADD CONSTRAINT PK_Notificacao PRIMARY KEY (notificacaoID);

ALTER TABLE Notificacao ADD CONSTRAINT FK_Notificacao_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

ALTER TABLE Notificacao ADD CONSTRAINT FK_Notificacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES Contribuicao (contribuicaoID);

/*-------------- RecuperacaoDePassword --------------*/

DROP TABLE IF EXISTS RecuperacaoDePassword;
CREATE TABLE IF NOT EXISTS RecuperacaoDePassword (
	recuperacaoDePasswordID serial NOT NULL,
	codigoValidacao varchar(50) NOT NULL,
	data timestamp DEFAULT current_timestamp,
	membroID integer NOT NULL,
	CONSTRAINT UK_RecuperacaoDePassword_codigoValidacao UNIQUE (codigoValidacao)
);

ALTER TABLE RecuperacaoDePassword ADD CONSTRAINT PK_RecuperacaoDePassword PRIMARY KEY (recuperacaoDePasswordID);

ALTER TABLE PK_RecuperacaoDePassword ADD CONSTRAINT FK_RecuperacaoDePassword_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

/*-------------- Resposta --------------*/

DROP TABLE IF EXISTS Resposta;
CREATE TABLE IF NOT EXISTS Resposta (
	respostaID integer NOT NULL,
	correcta boolean,
	descricao text NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE Resposta ADD CONSTRAINT PK_Resposta PRIMARY KEY (respostaID);

ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_Contribuicao 
	FOREIGN KEY (respostaID) REFERENCES Contribuicao (contribuicaoID);

ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES Pergunta (perguntaID);

/*-------------- Voto --------------*/

DROP TABLE IF EXISTS Voto;
CREATE TABLE IF NOT EXISTS Voto (
	positivo boolean,
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE Voto ADD CONSTRAINT PK_Voto PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE Voto ADD CONSTRAINT FK_Voto_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

ALTER TABLE Voto ADD CONSTRAINT FK_Voto_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES Contribuicao (contribuicaoID);

/*-------------- Visualizacao --------------*/

DROP TABLE IF EXISTS Visualizacao;
CREATE TABLE IF NOT EXISTS Visualizacao (
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE Visualizacao ADD CONSTRAINT PK_Visualizacao PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE Visualizacao ADD CONSTRAINT FK_Visualizacao_Membro 
	FOREIGN KEY (membroID) REFERENCES Membro (membroID);

ALTER TABLE Visualizacao ADD CONSTRAINT FK_Visualizacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES Contribuicao (contribuicaoID);
