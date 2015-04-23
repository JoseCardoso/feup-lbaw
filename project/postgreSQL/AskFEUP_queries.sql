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
  WHERE resposta.perguntaid = pergunta.perguntaid AND utilizador.utilizadorid = contribuicao.membroid AND pergunta.perguntaid = contribuicao.contribuicaoid
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
SELECT pergunta.perguntaid, pergunta.categoriaid, pergunta.texto, pergunta.descricao, categoria.tipo
   FROM askfeup.pergunta
   JOIN askfeup.categoria ON pergunta.categoriaid = categoria.categoriaid;

/** 5. Lista de Perguntas por Tags**/
drop view if exists askfeup.perguntasportags;
CREATE VIEW askfeup.perguntasportags AS
SELECT tag.nome, pergunta.texto
   FROM askfeup.perguntatag
   JOIN askfeup.tag ON perguntatag.tagid = tag.tagid
   JOIN askfeup.pergunta ON perguntatag.perguntaid = pergunta.perguntaid;

/** 6. Lista de Respostas assinaladas como Correctas**/
drop view if exists askfeup.respostascorrectas;
create view askfeup.respostascorrectas as
SELECT pergunta.texto, resposta.correcta, resposta.descricao
   FROM askfeup.pergunta
   JOIN askfeup.resposta ON pergunta.perguntaid = resposta.perguntaid
  WHERE resposta.correcta = true;

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
SELECT resposta.respostaid
   FROM askfeup.resposta, askfeup.pergunta
  WHERE pergunta.perguntaid = resposta.perguntaid;

/** 9. Lista de comentários a uma contribuição **/
drop view if exists askfeup.comentariosdecontribuicao;
create view askfeup.comentariosdecontribuicao as
SELECT comentario.comentarioid
   FROM askfeup.contribuicao, askfeup.comentario
  WHERE comentario.contribuicaoid = comentario.comentarioid;

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
SELECT pergunta.perguntaid
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
  