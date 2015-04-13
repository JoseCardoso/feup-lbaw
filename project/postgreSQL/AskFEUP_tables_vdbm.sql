DROP TABLE IF EXISTS askFEUP.Utilizador;
CREATE TABLE IF NOT EXISTS askFEUP.Utilizador (
	utilizadorID serial NOT NULL,
	username text NOT NULL,
	password text NOT NULL,
	CONSTRAINT UK_Utilizador_username UNIQUE (username)
);

ALTER TABLE askFEUP.Utilizador ADD CONSTRAINT PK_Utilizador PRIMARY KEY (utilizadorID);

DROP TABLE IF EXISTS askFEUP.Administrador;
CREATE TABLE IF NOT EXISTS askFEUP.Administrador ( 
	administradorID integer NOT NULL
);

ALTER TABLE askFEUP.Administrador ADD CONSTRAINT PK_Administrador PRIMARY KEY (administradorID);

ALTER TABLE askFEUP.Administrador ADD CONSTRAINT FK_Administrador_Utilizador
	FOREIGN KEY (administradorID) REFERENCES askFEUP.Utilizador (utilizadorID);

DROP TABLE IF EXISTS askFEUP.Contribuicao;
CREATE TABLE IF NOT EXISTS askFEUP.Contribuicao (
	contribuicaoID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	diferençaVotos integer,
	votosNegativos integer,
	votosPositivos integer,
	membroID integer NOT NULL
);

ALTER TABLE askFEUP.Contribuicao ADD CONSTRAINT PK_Contribuicao PRIMARY KEY (contribuicaoID);

DROP TABLE IF EXISTS askFEUP.Categoria;
CREATE TABLE IF NOT EXISTS askFEUP.Categoria (
	categoriaID serial NOT NULL,
	tipo varchar(20) NOT NULL,
	CONSTRAINT UK_Categoria_tipo UNIQUE (tipo)
);

ALTER TABLE askFEUP.Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoriaID);

DROP TABLE IF EXISTS askFEUP.Pergunta;
CREATE TABLE IF NOT EXISTS askFEUP.Pergunta ( 
	perguntaID integer NOT NULL,
	texto text NOT NULL,
	descricao text,
	categoriaID integer NOT NULL
);

ALTER TABLE askFEUP.Pergunta ADD CONSTRAINT PK_Pergunta PRIMARY KEY (perguntaID);

ALTER TABLE askFEUP.Pergunta ADD CONSTRAINT FK_Pergunta_Categoria 
	FOREIGN KEY (categoriaID) REFERENCES askFEUP.Categoria (categoriaID);

ALTER TABLE askFEUP.Pergunta ADD CONSTRAINT FK_Pergunta_Contribuicao 
	FOREIGN KEY (perguntaID) REFERENCES askFEUP.Contribuicao (contribuicaoID);

DROP TABLE IF EXISTS askFEUP.Tag;
CREATE TABLE IF NOT EXISTS askFEUP.Tag (
	tagID serial NOT NULL,
	nome varchar(20) NOT NULL,
	CONSTRAINT UK_Tag_nome UNIQUE (nome)
);

ALTER TABLE askFEUP.Tag ADD CONSTRAINT PK_Tag PRIMARY KEY (tagID);

DROP TABLE IF EXISTS askFEUP.Badge;
CREATE TABLE IF NOT EXISTS askFEUP.Badge (
	badgeID serial NOT NULL,
	nome varchar(20) NOT NULL,
	descricao text,
	CONSTRAINT UK_Badge_nome UNIQUE (nome)
);

ALTER TABLE askFEUP.Badge ADD CONSTRAINT PK_Badge PRIMARY KEY (badgeID);

DROP TABLE IF EXISTS askFEUP.Cidade;
CREATE TABLE IF NOT EXISTS askFEUP.Cidade (
	cidadeID serial NOT NULL,
	nome varchar(20) NOT NULL,
	codigoPostal int NOT NULL,
	CONSTRAINT UK_Cidade_codigoPostal UNIQUE (codigoPostal)	
);

ALTER TABLE askFEUP.Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (cidadeID);

DROP TABLE IF EXISTS askFEUP.Membro;
CREATE TABLE IF NOT EXISTS askFEUP.Membro (
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

ALTER TABLE askFEUP.Membro ADD CONSTRAINT PK_Membro PRIMARY KEY (membroID);

ALTER TABLE askFEUP.Membro ADD CONSTRAINT FK_Membro_Cidade 
	FOREIGN KEY (cidadeID) REFERENCES askFEUP.Cidade (cidadeID);

ALTER TABLE askFEUP.Membro ADD CONSTRAINT FK_Membro_Utilizador 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Utilizador (utilizadorID);

DROP TABLE IF EXISTS askFEUP.Comentario;
CREATE TABLE IF NOT EXISTS Comentario (
	comentarioID serial NOT NULL,
	data timestamp DEFAULT current_timestamp,
	descricao text NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE askFEUP.Comentario ADD CONSTRAINT PK_Comentario PRIMARY KEY (comentarioID);

ALTER TABLE askFEUP.Comentario ADD CONSTRAINT FK_Comentario_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askFEUP.Contribuicao (contribuicaoID);

ALTER TABLE askFEUP.Comentario ADD CONSTRAINT FK_Comentario_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

DROP TABLE IF EXISTS askFEUP.Favorita;
CREATE TABLE IF NOT EXISTS askFEUP.Favorita (
	membroID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askFEUP.Favorita ADD CONSTRAINT PK_Favorita PRIMARY KEY (membroID, perguntaID);

ALTER TABLE askFEUP.Favorita ADD CONSTRAINT FK_Favorita_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

ALTER TABLE askFEUP.Favorita ADD CONSTRAINT FK_Favorita_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askFEUP.Pergunta (perguntaID);

DROP TABLE IF EXISTS askFEUP.BadgeMembro;
CREATE TABLE IF NOT EXISTS askFEUP.BadgeMembro (
	membroID integer NOT NULL,
	badgeID integer NOT NULL
);

ALTER TABLE askFEUP.BadgeMembro ADD CONSTRAINT PK_BadgeMembro PRIMARY KEY (membroID, badgeID);

ALTER TABLE askFEUP.BadgeMembro ADD CONSTRAINT Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

ALTER TABLE askFEUP.BadgeMembro ADD CONSTRAINT Badge 
	FOREIGN KEY (badgeID) REFERENCES askFEUP.Badge (badgeID);

DROP TABLE IF EXISTS askFEUP.PerguntaTag;
CREATE TABLE IF NOT EXISTS askFEUP.PerguntaTag (
	tagID integer NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askFEUP.PerguntaTag ADD CONSTRAINT PK_PerguntaTag PRIMARY KEY (perguntaID, tagID);

ALTER TABLE askFEUP.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Tag
	FOREIGN KEY (tagID) REFERENCES askFEUP.Tag (tagID);

ALTER TABLE askFEUP.PerguntaTag ADD CONSTRAINT FK_PerguntaTag_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askFEUP.Pergunta (perguntaID);

DROP TABLE IF EXISTS askFEUP.Notificacao;
CREATE TABLE IF NOT EXISTS askFEUP.Notificacao (
	notificacaoID serial NOT NULL,
	contribuicaoID integer NOT NULL,
	membroID integer NOT NULL
);

ALTER TABLE askFEUP.Notificacao ADD CONSTRAINT PK_Notificacao PRIMARY KEY (notificacaoID);

ALTER TABLE askFEUP.Notificacao ADD CONSTRAINT FK_Notificacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

ALTER TABLE askFEUP.Notificacao ADD CONSTRAINT FK_Notificacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askFEUP.Contribuicao (contribuicaoID);

DROP TABLE IF EXISTS askFEUP.RecuperacaoDePassword;
CREATE TABLE IF NOT EXISTS askFEUP.RecuperacaoDePassword (
	recuperacaoDePasswordID serial NOT NULL,
	codigoValidacao varchar(50) NOT NULL,
	data timestamp DEFAULT current_timestamp,
	membroID integer NOT NULL,
	CONSTRAINT UK_RecuperacaoDePassword_codigoValidacao UNIQUE (codigoValidacao)
);

ALTER TABLE askFEUP.RecuperacaoDePassword ADD CONSTRAINT PK_RecuperacaoDePassword PRIMARY KEY (recuperacaoDePasswordID);

ALTER TABLE PK_RecuperacaoDePassword ADD CONSTRAINT FK_RecuperacaoDePassword_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

DROP TABLE IF EXISTS askFEUP.Resposta;
CREATE TABLE IF NOT EXISTS askFEUP.Resposta (
	respostaID integer NOT NULL,
	correcta boolean,
	descricao text NOT NULL,
	perguntaID integer NOT NULL
);

ALTER TABLE askFEUP.Resposta ADD CONSTRAINT PK_Resposta PRIMARY KEY (respostaID);

ALTER TABLE askFEUP.Resposta ADD CONSTRAINT FK_Resposta_Contribuicao 
	FOREIGN KEY (respostaID) REFERENCES askFEUP.Contribuicao (contribuicaoID);

ALTER TABLE askFEUP.Resposta ADD CONSTRAINT FK_Resposta_Pergunta 
	FOREIGN KEY (perguntaID) REFERENCES askFEUP.Pergunta (perguntaID);

DROP TABLE IF EXISTS askFEUP.Voto;
CREATE TABLE IF NOT EXISTS askFEUP.Voto (
	positivo boolean,
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE askFEUP.Voto ADD CONSTRAINT PK_Voto PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE askFEUP.Voto ADD CONSTRAINT FK_Voto_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

ALTER TABLE askFEUP.Voto ADD CONSTRAINT FK_Voto_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askFEUP.Contribuicao (contribuicaoID);

DROP TABLE IF EXISTS askFEUP.Visualizacao;
CREATE TABLE IF NOT EXISTS askFEUP.Visualizacao (
	membroID integer NOT NULL,
	contribuicaoID integer NOT NULL
);

ALTER TABLE askFEUP.Visualizacao ADD CONSTRAINT PK_Visualizacao PRIMARY KEY (membroID, contribuicaoID);


ALTER TABLE askFEUP.Visualizacao ADD CONSTRAINT FK_Visualizacao_Membro 
	FOREIGN KEY (membroID) REFERENCES askFEUP.Membro (membroID);

ALTER TABLE askFEUP.Visualizacao ADD CONSTRAINT FK_Visualizacao_Contribuicao 
	FOREIGN KEY (contribuicaoID) REFERENCES askFEUP.Contribuicao (contribuicaoID);
