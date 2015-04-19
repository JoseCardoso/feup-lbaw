/** AskFEUP **/
/** Insert Data **/

/** Utilizadores **/
/* (id, username, password) */
INSERT INTO askfeup.Utilizador VALUES (1, 'botas', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (2, 'ferrolho', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (3, 'betao', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (4, 'zoid', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (5, 'olamundo', 'admin1234');
INSERT INTO askfeup.Utilizador VALUES (6, 'lbaw1424', 'olamundo');
INSERT INTO askfeup.Utilizador VALUES (7, 'okapa', 'hashtag');
INSERT INTO askfeup.Utilizador VALUES (8, 'blackwoman', 'codefever');
INSERT INTO askfeup.Utilizador VALUES (9, 'joker', 'batmanisdead');
INSERT INTO askfeup.Utilizador VALUES (10, 'vanillagirl', 'loveicecream');

/** Administradores **/
/* (idUtilizador) */
INSERT INTO askfeup.Administrador VALUES (5);
INSERT INTO askfeup.Administrador VALUES (6);

/** Cidades **/
/* (id, nome, codigo-postal) */
INSERT INTO askfeup.Cidade VALUES (1, 'Lisboa', 1000);
INSERT INTO askfeup.Cidade VALUES (2, 'Lisboa', 1050);
INSERT INTO askfeup.Cidade VALUES (3, 'Lisboa', 1070);
INSERT INTO askfeup.Cidade VALUES (4, 'Lisboa', 1100);
INSERT INTO askfeup.Cidade VALUES (5, 'Lisboa', 1150);
INSERT INTO askfeup.Cidade VALUES (6, 'Lisboa', 1170);
INSERT INTO askfeup.Cidade VALUES (7, 'Lisboa', 1200);
INSERT INTO askfeup.Cidade VALUES (8, 'Lisboa', 1250);
INSERT INTO askfeup.Cidade VALUES (9, 'Lisboa', 1300);
INSERT INTO askfeup.Cidade VALUES (10, 'Lisboa', 1400);
INSERT INTO askfeup.Cidade VALUES (11, 'Lisboa', 1500);
INSERT INTO askfeup.Cidade VALUES (12, 'Lisboa', 1600);
INSERT INTO askfeup.Cidade VALUES (13, 'Lisboa', 1700);
INSERT INTO askfeup.Cidade VALUES (14, 'Lisboa', 1750);
INSERT INTO askfeup.Cidade VALUES (15, 'Lisboa', 1800);
INSERT INTO askfeup.Cidade VALUES (16, 'Lisboa', 1900);
INSERT INTO askfeup.Cidade VALUES (17, 'Lisboa', 1990);
INSERT INTO askfeup.Cidade VALUES (18, 'Porto', 4000);
INSERT INTO askfeup.Cidade VALUES (19, 'Porto', 4050);
INSERT INTO askfeup.Cidade VALUES (20, 'Porto', 4100);
INSERT INTO askfeup.Cidade VALUES (21, 'Porto', 4150);
INSERT INTO askfeup.Cidade VALUES (22, 'Porto', 4200);
INSERT INTO askfeup.Cidade VALUES (23, 'Porto', 4250);
INSERT INTO askfeup.Cidade VALUES (24, 'Porto', 4300);
INSERT INTO askfeup.Cidade VALUES (25, 'Porto', 4350);
INSERT INTO askfeup.Cidade VALUES (26, 'Aveiro', 3800);
INSERT INTO askfeup.Cidade VALUES (27, 'Aveiro', 3810);
INSERT INTO askfeup.Cidade VALUES (28, 'Beja', 7800);
INSERT INTO askfeup.Cidade VALUES (29, 'Braga', 4700);
INSERT INTO askfeup.Cidade VALUES (30, 'Braga', 4705);
INSERT INTO askfeup.Cidade VALUES (31, 'Braga', 4710);
INSERT INTO askfeup.Cidade VALUES (32, 'Braga', 4715);
INSERT INTO askfeup.Cidade VALUES (33, 'Bragança', 5300);
INSERT INTO askfeup.Cidade VALUES (34, 'Castelo Branco', 6000);
INSERT INTO askfeup.Cidade VALUES (35, 'Coimbra', 3000);
INSERT INTO askfeup.Cidade VALUES (36, 'Coimbra', 3020);
INSERT INTO askfeup.Cidade VALUES (37, 'Coimbra', 3025);
INSERT INTO askfeup.Cidade VALUES (38, 'Coimbra', 3030);
INSERT INTO askfeup.Cidade VALUES (39, 'Coimbra', 3040);
INSERT INTO askfeup.Cidade VALUES (40, 'Coimbra', 3045);
INSERT INTO askfeup.Cidade VALUES (41, 'Évora', 7000);
INSERT INTO askfeup.Cidade VALUES (42, 'Évora', 7005);
INSERT INTO askfeup.Cidade VALUES (43, 'Faro', 8000);
INSERT INTO askfeup.Cidade VALUES (44, 'Faro', 8805);
INSERT INTO askfeup.Cidade VALUES (45, 'Funchal', 9000);
INSERT INTO askfeup.Cidade VALUES (46, 'Funchal', 9020);
INSERT INTO askfeup.Cidade VALUES (47, 'Funchal', 9030);
INSERT INTO askfeup.Cidade VALUES (48, 'Funchal', 9050);
INSERT INTO askfeup.Cidade VALUES (48, 'Funchal', 9050);
INSERT INTO askfeup.Cidade VALUES (49, 'Guarda', 6300);
INSERT INTO askfeup.Cidade VALUES (50, 'Leiria', 2400);
INSERT INTO askfeup.Cidade VALUES (51, 'Leiria', 2405);
INSERT INTO askfeup.Cidade VALUES (52, 'Leiria', 2410);
INSERT INTO askfeup.Cidade VALUES (53, 'Leiria', 2415);
INSERT INTO askfeup.Cidade VALUES (54, 'Leiria', 2420);
INSERT INTO askfeup.Cidade VALUES (55, 'Ponte Delgada', 9500);
INSERT INTO askfeup.Cidade VALUES (56, 'Portalegre', 7300);
INSERT INTO askfeup.Cidade VALUES (57, 'Santarém', 2000);
INSERT INTO askfeup.Cidade VALUES (58, 'Santarém', 2005);
INSERT INTO askfeup.Cidade VALUES (59, 'Setúbal', 2900);
INSERT INTO askfeup.Cidade VALUES (60, 'Setúbal', 2910);
INSERT INTO askfeup.Cidade VALUES (61, 'Viana do Castelo', 4900);
INSERT INTO askfeup.Cidade VALUES (62, 'Vila Real', 5000);
INSERT INTO askfeup.Cidade VALUES (63, 'Viseu', 3500);
INSERT INTO askfeup.Cidade VALUES (64, 'Viseu', 3505);
INSERT INTO askfeup.Cidade VALUES (65, 'Viseu', 3510);
INSERT INTO askfeup.Cidade VALUES (66, 'Viseu', 3515);
INSERT INTO askfeup.Cidade VALUES (67, 'Porto Santo', 9400);

/** Membros **/
/* (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, utilizadorID, cidadeID) */
INSERT INTO askfeup.Membro VALUES ('true', 'João', 'Pereira', 'ei12023@fe.up.pt', 0, '2015-04-13 04:14:00', '2015-04-18 04:15:00', 1, 2);
INSERT INTO askfeup.Membro VALUES ('true', 'Henrique', 'Ferrolho', 'ei12079@fe.up.pt', 0, '2015-04-14 12:05:00', '2015-04-18 00:01:00', 2, 4);
INSERT INTO askfeup.Membro VALUES ('true', 'José', 'Cardoso', 'ei12027@fe.up.pt', 0, '2015-04-14 15:14:00', '2015-04-18 04:18:00', 3, 1);
INSERT INTO askfeup.Membro VALUES ('true', 'Gabriel', 'Souto', 'ei12087@fe.up.pt', 0, '2015-04-14 20:14:00', '2015-04-08 04:15:00', 4, 1);
INSERT INTO askfeup.Membro VALUES ('true', 'Tiago', 'Negro', 'okapaman@gmail.com', 0, '2015-04-16 05:00:21', '2015-04-21 18:33:12', 7, 67);
INSERT INTO askfeup.Membro VALUES ('true', 'Gisela', 'Tosta', 'manteigascompao@hotmail.com', 0, '2015-04-17 15:02:03', '2015-04-22 00:00:57', 8, 61);
INSERT INTO askfeup.Membro VALUES ('true', 'Jorge', 'Castro', 'jorgecastro4@sapo.pt', 0, '2015-04-18 12:13:43', '2015-04-18 12:13:43', 9, 55);
INSERT INTO askfeup.Membro VALUES ('true', 'Alice', 'Correia', 'lice_correia94@gmail.com', 0, '2015-04-18 14:13:43', '2015-04-18 19:13:43', 10, 38);

/** Categorias **/
/* (id, tipo) */
INSERT INTO askfeup.Categoria VALUES (1, 'Lazer');
INSERT INTO askfeup.Categoria VALUES (2, 'Desporto');
INSERT INTO askfeup.Categoria VALUES (3, 'Emprego');
INSERT INTO askfeup.Categoria VALUES (4, 'Comida');
INSERT INTO askfeup.Categoria VALUES (5, 'Informática');
INSERT INTO askfeup.Categoria VALUES (6, 'Programação');
INSERT INTO askfeup.Categoria VALUES (7, 'Metalúrgica');
INSERT INTO askfeup.Categoria VALUES (8, 'Cívil');
INSERT INTO askfeup.Categoria VALUES (9, 'Eletrotécnica');
INSERT INTO askfeup.Categoria VALUES (10, 'Associação de Estudantes');
INSERT INTO askfeup.Categoria VALUES (11, 'Mestrados');
INSERT INTO askfeup.Categoria VALUES (12, 'Doutoramentos');
INSERT INTO askfeup.Categoria VALUES (13, 'Gestão');
INSERT INTO askfeup.Categoria VALUES (14, 'Indústra');
INSERT INTO askfeup.Categoria VALUES (15, 'Diversão Nocturna');

/** Contribuições **/
/* (id, data, diferancaVotos, votosNegativos, votosPositivos, membroID) */
INSERT INTO askfeup.Contribuicao VALUES (1, '2015-04-15 22:32:00', 2, 1, 3, 1);
INSERT INTO askfeup.Contribuicao VALUES (2, '2015-04-15 22:33:40', -3, 3, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (3, '2015-04-15 22:34:10', 0, 1, 1, 3);

INSERT INTO askfeup.Contribuicao VALUES (4, '2015-04-16 23:34:30', 6, 2, 8, 4);
INSERT INTO askfeup.Contribuicao VALUES (5, '2015-04-16 23:39:03', -1, 3, 2, 1);
INSERT INTO askfeup.Contribuicao VALUES (6, '2015-04-16 23:45:12', 5, 0, 5, 3);
INSERT INTO askfeup.Contribuicao VALUES (7, '2015-04-16 23:50:46', 0, 1, 1, 2);

INSERT INTO askfeup.Contribuicao VALUES (8, '2015-04-16 23:51:00', 8, 0, 8, 10);
INSERT INTO askfeup.Contribuicao VALUES (9, '2015-04-16 23:59:12', 4, 0, 4, 9);
INSERT INTO askfeup.Contribuicao VALUES (10, '2015-04-17 00:10:56', 7, 1, 8, 2);

INSERT INTO askfeup.Contribuicao VALUES (11, '2015-04-18 15:11:02', 2, 2, 4, 2);
INSERT INTO askfeup.Contribuicao VALUES (12, '2015-04-18 14:10:22', -3, 3, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (13, '2015-04-18 16:30:45', 4, 0, 4, 3);

INSERT INTO askfeup.Contribuicao VALUES (14, '2015-04-18 17:01:12', 2, 0, 2, 7);
INSERT INTO askfeup.Contribuicao VALUES (15, '2015-04-18 18:31:47', 3, 0, 3, 9);

/** Perguntas **/
/* (contribuicaoID, texto, descrição, categoriaID) */
INSERT INTO askfeup.Pergunta VALUES (1, 'A Dª. Beatriz vende gomas?', 'Apetecia-me bastante comer gomas mas os únicos sítios que sei estão longe.', 4);

INSERT INTO askfeup.Pergunta VALUES (4, 'O Pavilhão Luís de Falcão dá para reservar?', 'Tenho um grupo de amigos e queriamos jogar à bola.', 2);

INSERT INTO askfeup.Pergunta VALUES (8, 'Quando é o próximo FEUPCaffe?', 'Ouvi dizer que vai um Dj famoso :D', 15);

INSERT INTO askfeup.Pergunta VALUES (11, 'Alguém já usou Laravel?', 'Queria saber se é bom ou não utilizar esta framework.', 6);

INSERT INTO askfeup.Pergunta VALUES (8, 'Quando é o próximo FEUPCaffe?', 'Ouvi dizer que vai um Dj famoso :D', 15);

INSERT INTO askfeup.Pergunta VALUES (14, 'Quando é o próximo teste de Betão?', 'Não consigo entrar no sigarra, deve estar em baixo o sistema.', 8);

/** Respostas **/
/* (contribuicaoID, correcta, descricao, perguntaID) */
INSERT INTO askfeup.Resposta VALUES (2, 'false', 'Nao vende.', 1);
INSERT INTO askfeup.Resposta VALUES (3, 'true', 'LOL. Vende sim. Abre das 9:00h ao 12:00h e das 13:30h às 19:00h', 1);

INSERT INTO askfeup.Resposta VALUES (5, 'false', 'Acho que não dá para reservar @zoid', 4);
INSERT INTO askfeup.Resposta VALUES (6, 'true', 'Dá para reservares mas tens de pagar. Aqui tens o link http://sigarra.up.pt/cdup/pt/web_base.gera_pagina?P_pagina=1026026', 4);
INSERT INTO askfeup.Resposta VALUES (7, 'false', '@zoid precisas de pessoas para jogar? Tou a precisar de fazer desporto, tou gordo.', 4);

INSERT INTO askfeup.Resposta VALUES (9, 'false', 'Acho que não va haver mais este ano.', 'ta a chegar a queima e nao devem fazer mais para se organizarem', 8);
INSERT INTO askfeup.Resposta VALUES (10, 'true', '@vanillagirl é esta Quinta-feira que vem, dia 23, o Mega FEUPCaffe, vai ser a despedida', 8);

INSERT INTO askfeup.Resposta VALUES (12, 'false', 'Sim, eu não gostei, faz tudo por ti.', 11);
INSERT INTO askfeup.Resposta VALUES (13, 'false', 'Sim já usei, laravel é muito bom, poupas imenso tempo a fazer coisas que sem a framework demoravas horas. Podes dipensar mais tempo a melhorar outras componentes.', 11);

INSERT INTO askfeup.Resposta VALUES (15, 'true', 'Dia 28 de Abril, às 9:00h nas salas B232, B208 e B104', 14);

/** Comentários **/
/* (id, data, decricao, contribuicaoID, membroID) */
INSERT INTO askfeup.Comentario VALUES (1, '2015-04-15 22:35:10', 'o @ferrolho tem razão, mas acho que é às 19:30h que fecha.', 3, 4);

INSERT INTO askfeup.Comentario VALUES (2, '2015-04-16 23:44:33', '@botas tem de dar, todos os pavilhoes permitem isso.', 5, 3);
INSERT INTO askfeup.Comentario VALUES (3, '2015-04-16 23:50:10', 'obrigado @betao já reservei :)', 6, 4);
INSERT INTO askfeup.Comentario VALUES (4, '2015-04-16 23:59:50', '@ferrolho podes vir :)', 7, 4);

INSERT INTO askfeup.Comentario VALUES (5, '2015-04-17 00:05:01', '@joker estas errado, ha sempre um para a despedida', 9, 2);
INSERT INTO askfeup.Comentario VALUES (6, '2015-04-17 00:11:41', '@ferrolho obrigado pela informaçao. É que eu este ano ainda não pude ir nenhuma vez e ia ficar triste se não houvesse mais :(', 10, 10);
INSERT INTO askfeup.Comentario VALUES (7, '2015-04-17 00:12:12', '@vanillagirl de nada sempre as ordens. Diverte te na quinta :D', 10, 2);
INSERT INTO askfeup.Comentario VALUES (8, '2015-04-17 01:03:45', 'vamos partir tudo !!! :D FEUPCaffe <3', 10, 7);

INSERT INTO askfeup.Comentario VALUES (9, '2015-04-18 16:25:00', 'Nao respondeste à questao colocada. E vale muito a pena, tu é que não das valor ou nao a sabes usar :p', 12, 3);



/** Badges **/
INSERT INTO askfeup.Badge VALUES (1, 'Primeira Dúvida', 'Faz uma pergunta!');
INSERT INTO askfeup.Badge VALUES (2, 'Curioso', 'Fizeste 10 perguntas!');
INSERT INTO askfeup.Badge VALUES (3, 'Questionador', 'Fizeste 50 perguntas!');
INSERT INTO askfeup.Badge VALUES (4, 'Rei das Perguntas', 'Fizeste 100 perguntas!');
INSERT INTO askfeup.Badge VALUES (5, 'Boa resposta', 'Respondeste correctamente a uma pergunta!');
INSERT INTO askfeup.Badge VALUES (6, 'Atencioso', 'Respondeste correctamente a 10 perguntas!');
INSERT INTO askfeup.Badge VALUES (7, 'Culto', 'Respondeste correctamente a 50 perguntas!');
INSERT INTO askfeup.Badge VALUES (8, 'Sábio', 'Respondeste correctamente a 100 perguntas!');
INSERT INTO askfeup.Badge VALUES (9, 'Primeiro Comentário', 'Fizeste um comentário!');
INSERT INTO askfeup.Badge VALUES (10, 'Crítico', 'Fizeste 10 comentários!');
INSERT INTO askfeup.Badge VALUES (11, 'Chato', 'Fizeste 50 comentários!');
INSERT INTO askfeup.Badge VALUES (12, 'Morre', 'Fizeste 100 comentários!');
INSERT INTO askfeup.Badge VALUES (13, 'Primeiro Voto', 'Boa, votaste!');
INSERT INTO askfeup.Badge VALUES (14, 'Participativo', 'Fizeste 10 votos!');
INSERT INTO askfeup.Badge VALUES (15, 'Avaliador', 'Fizeste 50 votos!');
INSERT INTO askfeup.Badge VALUES (16, 'Eleitor', 'Fizeste 100 votos!');

/** BadgeMembro **/
INSERT INTO askfeup.BadgeMembro	VALUES (1, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (2, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (3, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (1, 2);
INSERT INTO askfeup.BadgeMembro	VALUES (3, 2);

/** Tags **/
INSERT INTO askfeup.Tag VALUES (1, 'D.Beatriz');
INSERT INTO askfeup.Tag VALUES (2, 'Gomas');
INSERT INTO askfeup.Tag VALUES (3, 'Horário');

/** PerguntaTag **/
INSERT INTO askfeup.PerguntaTag	VALUES (1, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (1, 3);
INSERT INTO askfeup.PerguntaTag	VALUES (2, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 3);

/** Favoritas **/
INSERT INTO askfeup.Favorita VALUES (1, 1);
INSERT INTO askfeup.Favorita VALUES (1, 3);
INSERT INTO askfeup.Favorita VALUES (2, 3);

/** Notificações **/
INSERT INTO askfeup.Notificacao VALUES (1, 1, 1);
INSERT INTO askfeup.Notificacao VALUES (2, 1, 2);

/** Votos **/
INSERT INTO askfeup.Voto VALUES ('true', 3, 1);
INSERT INTO askfeup.Voto VALUES ('true', 4, 2);

/** Recup+erações de Password **/
INSERT INTO askfeup.RecuperacaoDePassword VALUES (1, 'umastringdepass', '2015-04-15 22:32:00', 1);
INSERT INTO askfeup.RecuperacaoDePassword VALUES (2, 'blablabla', '2015-04-15 22:32:00', 2);

/** Visualizações **/
INSERT INTO askfeup.Visualizacao VALUES (3, 1);
INSERT INTO askfeup.Visualizacao VALUES (4, 3);
