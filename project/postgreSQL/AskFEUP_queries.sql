/** AskFEUP **/
/** Queries **/

.print \n
.width 8 30
/** 1. Lista de perguntas ordenadas por pontuação **/
DROP VIEW IF EXISTS ordenacaoPorVotos;
CREATE VIEW IF NOT EXISTS ordenacaoPorVotos AS
SELECT Pergunta.texto
FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Categoria.categoriaID
ORDER BY Contribuição.diferençaVotos DESC;




/*DROP VIEW IF EXISTS sortByDifficulty;
CREATE VIEW  IF NOT EXISTS sortByDifficulty AS
SELECT Instrumento.idArtigo, Artigo.nome, Marca.nome 'Marca', dificuldade FROM Instrumento
INNER JOIN Artigo, Marca, Modelo 
ON Instrumento.idArtigo = Artigo.idArtigo AND Artigo.idmodelo = Modelo.idmodelo AND Modelo.idmarca = Marca.idmarca
ORDER BY dificuldade;
select * from sortByDifficulty;
*/


/** 8. Lista de respostas a uma pergunta **/
DROP VIEW IF EXISTS respostasAPerguntas;
CREATE VIEW IF NOT EXISTS respostasAPerguntas AS
SELECT Resposta.respostaID FROM Resposta , Pergunta
WHERE Pergunta.perguntaID = Resposta.perguntaID;

/** 9. Lista de comentários a uma contribuição **/
DROP VIEW IF EXISTS comentariosAContribuicao;
CREATE VIEW IF NOT EXISTS comentariosAContribuiçao AS
SELECT Comentário.comentarioID FROM Contribuição , Comentário
WHERE Comentário.contribuiçãoID = Comentário.comentarioID;

/** 10. Lista de utilizador que possuem um determinado Badge **/
DROP VIEW IF EXISTS membroPorBadge;
CREATE VIEW IF NOT EXISTS membroPorBadge AS
SELECT Membro.membroID FROM Membro , Badge, JoinBadgeToMembro
WHERE Membro.membroID = JoinBadgeToMembro.membroID AND Badge.badgeID = JoinBadgeToMembro.badgeID;

/** 11. Lista de badges que pertencem a determinado utilizador **/
DROP VIEW IF EXISTS badgePorMembro;
CREATE VIEW IF NOT EXISTS badgePorMembro AS
SELECT Badge.badgeID FROM Membro , Badge, JoinBadgeToMembro
WHERE Membro.membroID = JoinBadgeToMembro.membroID AND Badge.badgeID = JoinBadgeToMembro.badgeID;

/** 12. Lista de perguntas ordenadas por data de criação (recentes) **/
DROP VIEW IF EXISTS PerguntasOrdenadasPorAno;
CREATE VIEW IF NOT EXISTS PerguntasOrdenadasPorAno AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY Contribuição.data;

/** 13. Lista de perguntas mais populares (votos) **/
DROP VIEW IF EXISTS PerguntasPopulares;
CREATE VIEW IF NOT EXISTS PerguntasPopulares AS
SELECT Pergunta.perguntaID FROM Pergunta, Contribuição
WHERE Pergunta.perguntaID = Contribuição.contribuiçãoID
ORDER BY (Contribuição.votosPositivos + contribuição.votosNegativos);