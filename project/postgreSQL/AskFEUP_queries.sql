/** AskFEUP **/
/** Queries **/

/**.print \n
.width 8 30 **/

/** 1. Lista de perguntas ordenadas por pontuação (Testado) **/
 /**not working**/
create view askfeup.perguntasporpontuacao as
select "askfeup"."pergunta"."perguntaid" as "id",
 		"askfeup"."pergunta".texto as "conteudo",
 		"askfeup"."membro"."primeironome" as "membro",
 		"askfeup"."contribuicao"."diferencavotos" as "pontuacao";

 /**not working**/
/*perguntas por pontos do utilizador*/
create view askfeup.perguntasporpontosdoutilizador as 		
from "askfeup"."pergunta", "askfeup"."contribuicao", "askfeup"."membro"
where "askfeup"."pergunta"."perguntaid" = "askfeup"."contribuicao"."contribuicaoid"
and "askfeup"."contribuicao"."membroid" = "askfeup"."membro"."membroid"
order by "askfeup"."contribuicao"."diferencavotos" desc;

 /** 2. Lista de perguntas por utilizador (em que tenha actividade e não só as próprias) **/
 /**not working**/
create view askfeup.perguntasporutilizador as
select "askfeup"."utilizador"."username" as "user",
           "askfeup"."pergunta"."perguntaid" as "id",
 		"askfeup"."pergunta"."texto" as "conteudo"
 	from "askfeup"."pergunta", "askfeup"."membro", "askfeup"."comentario", "askfeup"."resposta", "askfeup"."contribuicao"
 	where "askfeup"."resposta"."perguntaid" = "askfeup"."pergunta"."perguntaid"
 	and "askfeup"."membro"."membroid" = "askfeup"."contribuicao"."membroid"
 	and "askfeup"."pergunta"."perguntaid" = "askfeup"."contribuicao"."contribuicaoid"
 	group by "askfeup"."pergunta"."perguntaid";


/** 8. Lista de respostas a uma pergunta **/

create view askfeup.respostasapergunta as
select "askfeup"."resposta"."respostaid"
from "askfeup"."resposta", "askfeup"."pergunta"
where "askfeup"."pergunta"."perguntaid" = "askfeup"."resposta"."perguntaid";

/** 9. Lista de comentários a uma contribuição **/
create view askfeup.comentariosdecontribuicao as
select "askfeup"."comentario"."comentarioid"
from "askfeup"."contribuicao", "askfeup"."comentario"
where "askfeup"."comentario"."contribuicaoid" = "askfeup"."comentario"."comentarioid";

/** 10. Lista de utilizadores que possuem um determinado Badge (vice-versa) (testado) **/
create view askfeup.utilizadoresbadge as
select "askfeup"."badge".nome as "nome", "askfeup"."membro"."primeironome" as "membro"
from "askfeup"."membro", "askfeup"."badge", "askfeup"."badgemembro"
where "askfeup"."membro"."membroid" = "askfeup"."badgemembro"."membroid"
and "askfeup"."badge"."badgeid" = "askfeup"."badgemembro"."badgeid";

/** 11. Lista de perguntas ordenadas por data de criação (recentes) **/
create view askfeup.perguntaspordata as
select "askfeup"."pergunta"."perguntaid"
from "askfeup"."pergunta", "askfeup"."contribuicao"
where "askfeup"."pergunta"."perguntaid" = "askfeup"."contribuicao"."contribuicaoid"
order by "askfeup"."contribuicao".data desc;

/** 12. Lista de perguntas mais populares (votos) **/
create view askfeup.perguntaspopulares as
select "askfeup"."pergunta"."perguntaid"
from "askfeup"."pergunta", "askfeup"."contribuicao"
where "askfeup"."pergunta"."perguntaid" = "askfeup"."contribuicao"."contribuicaoid"
order by "askfeup"."contribuicao"."votospositivos" + "askfeup"."contribuicao"."votosnegativos" desc;

/** Lista de Pergunta Favoritas por Utilizador **/
create view askfeup.favoritasporutilizador as
select "askfeup"."membro"."ultimonome", "askfeup"."membro"."primeironome", "askfeup"."pergunta".texto, "askfeup"."pergunta".descricao
from "askfeup"."membro"
join "askfeup"."favorita" on "askfeup"."membro"."membroid" = "askfeup"."favorita"."membroid"
join "askfeup"."pergunta" on "askfeup"."favorita"."perguntaid" = "askfeup"."pergunta"."perguntaid";

/** Lista de Perguntas por Categoria **/
create view askfeup.perguntasporcategoria as
select "askfeup"."pergunta"."perguntaid", "askfeup"."pergunta"."categoriaid", "askfeup"."pergunta"."texto", "askfeup"."pergunta"."descricao", "askfeup"."categoria"."tipo"
from "askfeup"."pergunta"
join "askfeup"."categoria" on "askfeup"."pergunta"."categoriaid" = "askfeup"."categoria"."categoriaid";

/** Lista de Respostas assinaladas como Correctas**/
create view askfeup.respostascorrectas as
select "askfeup"."pergunta"."texto", "askfeup"."resposta"."correcta", "askfeup"."resposta"."descricao"
from "askfeup"."pergunta"
join "askfeup"."resposta" on "askfeup"."pergunta"."perguntaid" = "askfeup"."resposta"."perguntaid"
where "askfeup"."resposta"."correcta" = true;

/** Lista de Perguntas por Tags**/
CREATE VIEW askfeup.PerguntasPorTags AS
SELECT "askfeup"."tag".nome, "askfeup"."pergunta".texto
FROM "askfeup"."perguntatag"
JOIN "askfeup"."tag" ON "askfeup"."perguntatag"."tagid" = "askfeup"."tag"."tagid"
JOIN "askfeup"."pergunta" ON "askfeup"."perguntatag"."perguntaid" = "askfeup"."pergunta"."perguntaid";

/** Lista de REspostas dadas por um Membro**/
CREATE VIEW askfeup.RespostasPorMembro AS
SELECT "askfeup"."resposta".correcta, "askfeup"."resposta".descricao
FROM "askfeup"."membro"
JOIN "askfeup"."contribuicao" ON "askfeup"."membro"."membroid" = "askfeup"."contribuicao"."membroid"
JOIN "askfeup"."resposta" ON "askfeup"."contribuicao"."contribuicaoid" = "askfeup"."resposta"."respostaid";
