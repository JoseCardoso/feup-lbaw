/** AskFEUP **/
/** Queries **/

/**.print \n
.width 8 30 **/

/** 1. Lista de perguntas ordenadas por pontuação (Testado) **/
create view askfeup.perguntasporpontuacao as
SELECT pergunta.perguntaid AS id, pergunta.texto AS conteudo, membro.primeironome AS membro, contribuicao.diferencavotos AS pontuacao
   FROM pergunta, contribuicao, membro
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid AND contribuicao.membroid = membro.membroid
  ORDER BY contribuicao.diferencavotos DESC;

 /** 2. Lista de perguntas por utilizador (em que tenha actividade e não só as próprias) **/
create view askfeup.perguntasporutilizador as
SELECT utilizador.username AS "user", pergunta.perguntaid AS id, pergunta.texto AS conteudo
   FROM utilizador, pergunta, membro, comentario, resposta, contribuicao
  WHERE resposta.perguntaid = pergunta.perguntaid AND utilizador.utilizadorid = contribuicao.membroid AND pergunta.perguntaid = contribuicao.contribuicaoid
  ORDER BY utilizador.username;


/** 8. Lista de respostas a uma pergunta **/
create view askfeup.respostasapergunta as
SELECT resposta.respostaid
   FROM resposta, pergunta
  WHERE pergunta.perguntaid = resposta.perguntaid;

/** 9. Lista de comentários a uma contribuição **/
create view askfeup.comentariosdecontribuicao as
SELECT comentario.comentarioid
   FROM contribuicao, comentario
  WHERE comentario.contribuicaoid = comentario.comentarioid;

/** 10. Lista de utilizadores que possuem um determinado Badge (vice-versa) (testado) **/
create view askfeup.utilizadoresbadge as
SELECT badge.nome, membro.primeironome AS membro
   FROM membro, badge, badgemembro
  WHERE membro.membroid = badgemembro.membroid AND badge.badgeid = badgemembro.badgeid;

/** 12. Lista de perguntas mais populares (votos) **/
create view askfeup.perguntaspopulares as
SELECT pergunta.perguntaid
   FROM pergunta, contribuicao
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid
  ORDER BY contribuicao.votospositivos + contribuicao.votosnegativos DESC;

/** Lista de Pergunta Favoritas por Utilizador **/
create view askfeup.favoritasporutilizador as
 SELECT membro.ultimonome, membro.primeironome, pergunta.texto, pergunta.descricao
   FROM membro
   JOIN favorita ON membro.membroid = favorita.membroid
   JOIN pergunta ON favorita.perguntaid = pergunta.perguntaid;

/** Lista de Perguntas por Categoria **/
create view askfeup.perguntasporcategoria as
SELECT pergunta.perguntaid, pergunta.categoriaid, pergunta.texto, pergunta.descricao, categoria.tipo
   FROM pergunta
   JOIN categoria ON pergunta.categoriaid = categoria.categoriaid;

/** Lista de Respostas assinaladas como Correctas**/
create view askfeup.respostascorrectas as
SELECT pergunta.texto, resposta.correcta, resposta.descricao
   FROM pergunta
   JOIN resposta ON pergunta.perguntaid = resposta.perguntaid
  WHERE resposta.correcta = true;

/** Lista de Perguntas por Tags**/
CREATE VIEW askfeup.PerguntasPorTags AS
SELECT tag.nome, pergunta.texto
   FROM perguntatag
   JOIN tag ON perguntatag.tagid = tag.tagid
   JOIN pergunta ON perguntatag.perguntaid = pergunta.perguntaid;

/** Lista de REspostas dadas por um Membro**/
CREATE VIEW askfeup.RespostasPorMembro AS
SELECT resposta.correcta, resposta.descricao
   FROM membro
   JOIN contribuicao ON membro.membroid = contribuicao.membroid
   JOIN resposta ON contribuicao.contribuicaoid = resposta.respostaid;

/** Lista de perguntas mais vistas **/
CREATE VIEW askfeup.PerguntasMaisVistas AS
SELECT pergunta.perguntaid, pergunta.texto, subquery1.views
   FROM pergunta, contribuicao, ( SELECT visualizacao.perguntaid, count(*) AS views
           FROM visualizacao
          GROUP BY visualizacao.perguntaid) subquery1
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid AND subquery1.perguntaid = pergunta.perguntaid
  ORDER BY subquery1.views DESC;

/** Lista de perguntas ordenadas por data de criação **/
CREATE VIEW askfeup.PerguntasPorDataDeCriacao AS
 SELECT pergunta.perguntaid, pergunta.texto
   FROM pergunta, contribuicao
  WHERE pergunta.perguntaid = contribuicao.contribuicaoid
  ORDER BY contribuicao.data;