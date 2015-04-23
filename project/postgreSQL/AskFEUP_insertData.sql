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
INSERT INTO askfeup.Membro VALUES ('true', 'João', 'Pereira', 'ei12023@fe.up.pt', DEFAULT, '2015-04-13 04:14:00', '2015-04-18 04:15:00', 1, 22);
INSERT INTO askfeup.Membro VALUES ('true', 'Henrique', 'Ferrolho', 'ei12079@fe.up.pt', DEFAULT, '2015-04-14 12:05:00', '2015-04-18 00:01:00', 2, 63);
INSERT INTO askfeup.Membro VALUES ('true', 'José', 'Cardoso', 'ei12027@fe.up.pt', DEFAULT, '2015-04-14 15:14:00', '2015-04-18 04:18:00', 3, 18);
INSERT INTO askfeup.Membro VALUES ('true', 'Gabriel', 'Souto', 'ei12087@fe.up.pt', DEFAULT, '2015-04-14 20:14:00', '2015-04-08 04:15:00', 4, 18);
INSERT INTO askfeup.Membro VALUES ('true', 'Tiago', 'Negro', 'okapaman@gmail.com', DEFAULT, '2015-04-16 05:00:21', '2015-04-21 18:33:12', 7, 67);
INSERT INTO askfeup.Membro VALUES ('true', 'Gisela', 'Tosta', 'manteigascompao@hotmail.com', DEFAULT, '2015-04-17 15:02:03', '2015-04-22 00:00:57', 8, 61);
INSERT INTO askfeup.Membro VALUES ('true', 'Jorge', 'Castro', 'jorgecastro4@sapo.pt', DEFAULT, '2015-04-18 12:13:43', '2015-04-18 12:13:43', 9, 55);
INSERT INTO askfeup.Membro VALUES ('true', 'Alice', 'Correia', 'lice_correia94@gmail.com', DEFAULT, '2015-04-18 14:13:43', '2015-04-18 19:13:43', 10, 38);

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
INSERT INTO askfeup.Categoria VALUES (16, 'Localizações');

/** Contribuições **/
/* (id, data, diferancaVotos, votosNegativos, votosPositivos, membroID) */
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:33:40', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-15 22:34:10', 0, 0, 0, 3);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:34:30', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:39:03', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:45:12', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:50:46', 0, 0, 0, 2);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:51:00', 0, 0, 0, 10);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-16 23:59:12', 0, 0, 0, 9);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-17 00:10:56', 0, 0, 0, 2);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 15:11:02', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 14:10:22', 0, 0, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 16:30:45', 0, 0, 0, 3);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 17:01:12', 0, 0, 0, 7);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 18:31:47', 0, 0, 0, 9);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:41:23', 0, 0, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:46:32', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:48:11', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:50:22', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-18 19:55:55', 0, 0, 0, 1);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 08:41:23', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 09:10:32', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 10:48:11', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 10:50:22', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 11:55:55', 0, 0, 0, 7);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 14:05:32', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 15:45:21', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-19 15:56:02', 0, 0, 0, 10);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:12:32', 0, 0, 0, 10);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:14:38', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 10:15:32', 0, 0, 0, 1);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:00:01', 0, 0, 0, 9);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:02:45', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 12:02:46', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 13:03:57', 0, 0, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-20 13:06:00', 0, 0, 0, 4);

INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 11:45:23', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 13:56:12', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (DEFAULT, '2015-04-22 14:33:03', 0, 0, 0, 4);
=======
INSERT INTO askfeup.Contribuicao VALUES (1, '2015-04-15 22:32:00', 2, 1, 3, 1);
INSERT INTO askfeup.Contribuicao VALUES (2, '2015-04-15 22:33:40', -3, 3, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (3, '2015-04-15 22:34:10', 0, 1, 1, 3);

INSERT INTO askfeup.Contribuicao VALUES (4, '2015-04-16 23:34:30', 3, 2, 5, 4);
INSERT INTO askfeup.Contribuicao VALUES (5, '2015-04-16 23:39:03', -1, 3, 2, 1);
INSERT INTO askfeup.Contribuicao VALUES (6, '2015-04-16 23:45:12', 5, 0, 5, 3);
INSERT INTO askfeup.Contribuicao VALUES (7, '2015-04-16 23:50:46', 0, 1, 1, 2);

INSERT INTO askfeup.Contribuicao VALUES (8, '2015-04-16 23:51:00', 6, 0, 6, 10);
INSERT INTO askfeup.Contribuicao VALUES (9, '2015-04-16 23:59:12', 4, 0, 4, 9);
INSERT INTO askfeup.Contribuicao VALUES (10, '2015-04-17 00:10:56', 5, 1, 6, 2);

INSERT INTO askfeup.Contribuicao VALUES (11, '2015-04-18 15:11:02', 2, 2, 4, 2);
INSERT INTO askfeup.Contribuicao VALUES (12, '2015-04-18 14:10:22', -3, 3, 0, 8);
INSERT INTO askfeup.Contribuicao VALUES (13, '2015-04-18 16:30:45', 4, 0, 4, 3);

INSERT INTO askfeup.Contribuicao VALUES (14, '2015-04-18 17:01:12', 2, 0, 2, 7);
INSERT INTO askfeup.Contribuicao VALUES (15, '2015-04-18 18:31:47', 3, 0, 3, 9);

INSERT INTO askfeup.Contribuicao VALUES (16, '2015-04-18 19:41:23', 4, 1, 5, 8);
INSERT INTO askfeup.Contribuicao VALUES (17, '2015-04-18 19:46:32', -3, 4, 1, 2);
INSERT INTO askfeup.Contribuicao VALUES (18, '2015-04-18 19:48:11', -4, 4, 0, 3);
INSERT INTO askfeup.Contribuicao VALUES (19, '2015-04-18 19:50:22', -3, 5, 2, 4);
INSERT INTO askfeup.Contribuicao VALUES (20, '2015-04-18 19:55:55', 5, 0, 5, 1);

INSERT INTO askfeup.Contribuicao VALUES (21, '2015-04-19 08:41:23', 5, 0, 5, 4);
INSERT INTO askfeup.Contribuicao VALUES (22, '2015-04-19 09:10:32', 3, 0, 3, 2);
INSERT INTO askfeup.Contribuicao VALUES (23, '2015-04-19 10:48:11', 2, 0, 2, 3);
INSERT INTO askfeup.Contribuicao VALUES (24, '2015-04-19 10:50:22', 1, 0, 1, 1);
INSERT INTO askfeup.Contribuicao VALUES (25, '2015-04-19 11:55:55', -1, 3, 2, 7);

INSERT INTO askfeup.Contribuicao VALUES (26, '2015-04-19 14:05:32', 1, 2, 3, 3);
INSERT INTO askfeup.Contribuicao VALUES (27, '2015-04-19 15:45:21', 3, 1, 4, 2);
INSERT INTO askfeup.Contribuicao VALUES (28, '2015-04-19 15:56:02', 0, 1, 1, 10);

INSERT INTO askfeup.Contribuicao VALUES (29, '2015-04-20 10:12:32', 3, 0, 3, 10);
INSERT INTO askfeup.Contribuicao VALUES (30, '2015-04-20 10:14:38', 3, 0, 3, 2);
INSERT INTO askfeup.Contribuicao VALUES (31, '2015-04-20 10:15:32', 0, 1, 1, 1);

INSERT INTO askfeup.Contribuicao VALUES (32, '2015-04-20 12:00:01', 5, 1, 6, 9);
INSERT INTO askfeup.Contribuicao VALUES (33, '2015-04-20 12:02:45', 1, 0, 1, 1);
INSERT INTO askfeup.Contribuicao VALUES (34, '2015-04-20 12:02:46', 1, 0, 1, 2);
INSERT INTO askfeup.Contribuicao VALUES (35, '2015-04-20 13:03:57', 1, 0, 1, 3);
INSERT INTO askfeup.Contribuicao VALUES (36, '2015-04-20 13:06:00', -2, 3, 1, 4);

INSERT INTO askfeup.Contribuicao VALUES (37, '2015-04-22 11:45:23', 3, 0, 3, 1);
INSERT INTO askfeup.Contribuicao VALUES (38, '2015-04-22 13:56:12', 3, 0, 3, 2);
INSERT INTO askfeup.Contribuicao VALUES (39, '2015-04-22 14:33:03', 3, 0, 3, 4);

/** Perguntas **/
/* (contribuicaoID, texto, descrição, categoriaID) */
INSERT INTO askfeup.Pergunta VALUES (1, 'A Dª. Beatriz vende gomas?', 'Apetecia-me bastante comer gomas mas os únicos sítios que sei estão longe.', 4);

INSERT INTO askfeup.Pergunta VALUES (4, 'O Pavilhão Luís de Falcão dá para reservar?', 'Tenho um grupo de amigos e queriamos jogar à bola.', 2);

INSERT INTO askfeup.Pergunta VALUES (8, 'Quando é o próximo FEUPCaffe?', 'Ouvi dizer que vai um Dj famoso :D', 15);

INSERT INTO askfeup.Pergunta VALUES (11, 'Alguém já usou Laravel?', 'Queria saber se é bom ou não utilizar esta framework.', 6);

INSERT INTO askfeup.Pergunta VALUES (14, 'Quando é o próximo teste de Betão?', 'Não consigo entrar no sigarra, deve estar em baixo o sistema.', 8);

INSERT INTO askfeup.Pergunta VALUES (16, 'Alguém me pode dizer refeições rápidas para trazer para a faculdade para poupar dinheiro?', 'Quero poupar dinheiro para a Queima das Fitas :)', 4);

INSERT INTO askfeup.Pergunta VALUES (21, 'Quais os eventos que decorreram na feup nos próximos dias?', 'Gostaria de participar em pelo menos num.', 1);

INSERT INTO askfeup.Pergunta VALUES (26, 'Olá, onde posso actualizar o ano no meu cartao da FEUP?', '', 16);

INSERT INTO askfeup.Pergunta VALUES (29, 'Como faço para entrar para a AE?', 'É preciso convite?', 10);

INSERT INTO askfeup.Pergunta VALUES (32, 'Tenho um website que preciso de fazer, alguem interessado?', 'Há remunerações de 200 € :)', 6);

INSERT INTO askfeup.Pergunta VALUES (37, 'Existe transporte para o queimódromo a arrancar da FEUP?', 'Já agora que paragens perto do Campus existem...', 15);

/** Respostas **/
/* (contribuicaoID, correcta, descricao, perguntaID) */
INSERT INTO askfeup.Resposta VALUES (2, 'false', 'Nao vende.', 1);
INSERT INTO askfeup.Resposta VALUES (3, 'true', 'LOL. Vende sim. Abre das 9:00h ao 12:00h e das 13:30h às 19:00h', 1);

INSERT INTO askfeup.Resposta VALUES (5, 'false', 'Acho que não dá para reservar @zoid', 4);
INSERT INTO askfeup.Resposta VALUES (6, 'true', 'Dá para reservares mas tens de pagar. Aqui tens o link http://sigarra.up.pt/cdup/pt/web_base.gera_pagina?P_pagina=1026026', 4);
INSERT INTO askfeup.Resposta VALUES (7, 'false', '@zoid precisas de pessoas para jogar? Tou a precisar de fazer desporto, tou gordo.', 4);

INSERT INTO askfeup.Resposta VALUES (9, 'false', 'Acho que não va haver mais este ano. Ta a chegar a queima e nao devem fazer mais para se organizarem', 8);
INSERT INTO askfeup.Resposta VALUES (10, 'true', '@vanillagirl é esta Quinta-feira que vem, dia 23, o Mega FEUPCaffe, vai ser a despedida', 8);

INSERT INTO askfeup.Resposta VALUES (12, 'false', 'Sim, eu não gostei, faz tudo por ti.', 11);
INSERT INTO askfeup.Resposta VALUES (13, 'false', 'Sim já usei, laravel é muito bom, poupas imenso tempo a fazer coisas que sem a framework demoravas horas. Podes dipensar mais tempo a melhorar outras componentes.', 11);

INSERT INTO askfeup.Resposta VALUES (15, 'true', 'Dia 28 de Abril, às 9:00h nas salas B232, B208 e B104', 14);

INSERT INTO askfeup.Resposta VALUES (17, 'false', 'Cozido à Portuguesa e eu como também :)', 16);
INSERT INTO askfeup.Resposta VALUES (18, 'false', 'whisky-cola ? kkkk', 16);
INSERT INTO askfeup.Resposta VALUES (19, 'false', 'torta de morango, eu gosto xD', 16);
INSERT INTO askfeup.Resposta VALUES (20, 'true', 'Panados com arroz é fácil, uma batata cozida com atum. Tens muita coisa desta na net.', 16);

INSERT INTO askfeup.Resposta VALUES (22, 'false', 'Palestra de Limpeza no NI aka Núcleo de Informática', 21);
INSERT INTO askfeup.Resposta VALUES (23, 'false', 'jobIT15 nos Queijos', 21);
INSERT INTO askfeup.Resposta VALUES (24, 'true', 'Desmarca-te da JuniFEUP', 21);
INSERT INTO askfeup.Resposta VALUES (25, 'false', 'Corrida de carros de rolamentos na descida do INESC', 21);

INSERT INTO askfeup.Resposta VALUES (27, 'true', 'No CICA, ao lado do DEI (Departamento de Informática) :)', 26);
INSERT INTO askfeup.Resposta VALUES (28, 'false', 'Penso que vale mais a pena fazeres a transição para o cartao da UP agora que estão em indicios de mudança.', 26);

INSERT INTO askfeup.Resposta VALUES (30, 'true', 'Não apenas tens de pertencer a uma lista :)', 29);
INSERT INTO askfeup.Resposta VALUES (31, 'false', 'Fazendo uma lista xD lol', 29);

INSERT INTO askfeup.Resposta VALUES (33, 'false', 'Eu ! :D', 32);
INSERT INTO askfeup.Resposta VALUES (34, 'false', 'Faço por 150€ :D', 32);
INSERT INTO askfeup.Resposta VALUES (35, 'false', 'Faço por 150€ também e ainda te pago um bolo na cafetaria xD', 32);
INSERT INTO askfeup.Resposta VALUES (36, 'true', 'Faço te de borla e em uma semana :)', 32);

INSERT INTO askfeup.Resposta VALUES (38, 'true', 'Sim há, fica na entrada que la passam autocarros', 37);
INSERT INTO askfeup.Resposta VALUES (39, 'false', 'Na estrada da circunvalaçao passam em várias paragens, nao te sei agora é dizer quais mas são as que ficam paralelas ao campus', 37);

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

INSERT INTO askfeup.Comentario VALUES (10, '2015-04-18 19:49:31', 'LOL @betao, eu quero comer nao beber xD', 18, 8);
INSERT INTO askfeup.Comentario VALUES (11, '2015-04-18 19:55:31', '@zoid deixa de ser goloso. Alem de que isso dá muito trabalho :D', 19, 8);
INSERT INTO askfeup.Comentario VALUES (12, '2015-04-18 19:57:50', 'obrigado @botas, vou pesquisar, mas estava com muita preguiça xD', 20, 8);

INSERT INTO askfeup.Comentario VALUES (13, '2015-04-19 11:00:00', 'vou optar por esta, obrigado', 24, 4);
INSERT INTO askfeup.Comentario VALUES (14, '2015-04-19 11:05:46', 'LOL vou vos acusar malandros kkkkk', 25, 1);

INSERT INTO askfeup.Comentario VALUES (15, '2015-04-19 11:00:00', 'obrigado @ferrolho', 27, 3);
INSERT INTO askfeup.Comentario VALUES (16, '2015-04-19 11:05:46', 'tambem já ouvi falar nisso mas foram so rumores', 28, 3);
INSERT INTO askfeup.Comentario VALUES (17, '2015-04-19 11:06:59', 'vai a secretaria da FEUP e fala lá :)', 28, 10);
INSERT INTO askfeup.Comentario VALUES (18, '2015-04-19 11:07:30', 'vou fazer isso depois entao @vanillagirl :)', 28, 3);

INSERT INTO askfeup.Comentario VALUES (19, '2015-04-20 10:15:15', 'envia me email que eu vou fazer uma lista, se quiseres entrar :)', 29, 2);
INSERT INTO askfeup.Comentario VALUES (20, '2015-04-20 10:15:50', 'e ganhando as eleiçoes nao xD ?', 31, 2);
INSERT INTO askfeup.Comentario VALUES (21, '2015-04-20 10:16:43', 'obvio né xD ?', 31, 1);

INSERT INTO askfeup.Comentario VALUES (22, '2015-04-20 12:03:43', 'Isso não vale @ferrolho, baixando o preço obvio que ficas com o trabalho', 34, 1);
INSERT INTO askfeup.Comentario VALUES (23, '2015-04-20 12:04:34', 'Na guerra vale tudo sorry!', 34, 2);
INSERT INTO askfeup.Comentario VALUES (24, '2015-04-20 12:05:02', 'Fico-me pelos 150€ tambem @joker', 34, 1);
INSERT INTO askfeup.Comentario VALUES (25, '2015-04-20 13:04:54', '@betao a oferecer bolos tambem eu!', 35, 2);
INSERT INTO askfeup.Comentario VALUES (26, '2015-04-20 13:05:43', '@ferrolho podes falar!', 35, 1);
INSERT INTO askfeup.Comentario VALUES (27, '2015-04-20 13:06:43', 'rime @zoid', 36, 1);
INSERT INTO askfeup.Comentario VALUES (28, '2015-04-20 13:07:12', '@zoid da te um tiro', 36, 2);
INSERT INTO askfeup.Comentario VALUES (29, '2015-04-20 13:07:56', 'FOI MARA', 36, 3);
INSERT INTO askfeup.Comentario VALUES (30, '2015-04-20 13:07:56', 'Cada um faz aquilo que pode @botas, @ferrolho e @betao', 36, 4);

/** Tags **/
INSERT INTO askfeup.Tag VALUES (1, 'd.beatriz');
INSERT INTO askfeup.Tag VALUES (2, 'gomas');
INSERT INTO askfeup.Tag VALUES (3, 'fome');
INSERT INTO askfeup.Tag VALUES (4, 'pavilhao');
INSERT INTO askfeup.Tag VALUES (5, 'horario');
INSERT INTO askfeup.Tag VALUES (6, 'futebol');
INSERT INTO askfeup.Tag VALUES (7, 'musica');
INSERT INTO askfeup.Tag VALUES (8, 'noite');
INSERT INTO askfeup.Tag VALUES (9, 'diversao');
INSERT INTO askfeup.Tag VALUES (10, 'php');
INSERT INTO askfeup.Tag VALUES (11, 'web');
INSERT INTO askfeup.Tag VALUES (12, 'laravel');
INSERT INTO askfeup.Tag VALUES (13, 'facil');
INSERT INTO askfeup.Tag VALUES (14, 'comida');
INSERT INTO askfeup.Tag VALUES (15, 'poupança');
INSERT INTO askfeup.Tag VALUES (16, 'palestras');
INSERT INTO askfeup.Tag VALUES (17, 'conhecimento');
INSERT INTO askfeup.Tag VALUES (18, 'aprender');
INSERT INTO askfeup.Tag VALUES (19, 'cartaofeup');
INSERT INTO askfeup.Tag VALUES (20, 'actualizar');
INSERT INTO askfeup.Tag VALUES (21, 'ae');
INSERT INTO askfeup.Tag VALUES (22, 'website');
INSERT INTO askfeup.Tag VALUES (23, 'trabalho');
INSERT INTO askfeup.Tag VALUES (24, 'dinheiro');
INSERT INTO askfeup.Tag VALUES (25, 'transporte');
INSERT INTO askfeup.Tag VALUES (26, 'queima');

/** PerguntaTag **/
/* (idTag, idPergunta) */
INSERT INTO askfeup.PerguntaTag	VALUES (1, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (2, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 1);

INSERT INTO askfeup.PerguntaTag	VALUES (4, 4);
INSERT INTO askfeup.PerguntaTag	VALUES (5, 4);
INSERT INTO askfeup.PerguntaTag	VALUES (6, 4);

INSERT INTO askfeup.PerguntaTag	VALUES (7, 8);
INSERT INTO askfeup.PerguntaTag	VALUES (8, 8);
INSERT INTO askfeup.PerguntaTag	VALUES (9, 8);

INSERT INTO askfeup.PerguntaTag	VALUES (10, 11);
INSERT INTO askfeup.PerguntaTag	VALUES (11, 11);
INSERT INTO askfeup.PerguntaTag	VALUES (12, 11);

INSERT INTO askfeup.PerguntaTag	VALUES (3, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (13, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (14, 16);
INSERT INTO askfeup.PerguntaTag	VALUES (15, 16);

INSERT INTO askfeup.PerguntaTag	VALUES (16, 21);
INSERT INTO askfeup.PerguntaTag	VALUES (17, 21);
INSERT INTO askfeup.PerguntaTag	VALUES (18, 21);

INSERT INTO askfeup.PerguntaTag	VALUES (19, 26);
INSERT INTO askfeup.PerguntaTag	VALUES (20, 26);

INSERT INTO askfeup.PerguntaTag	VALUES (21, 29);

INSERT INTO askfeup.PerguntaTag	VALUES (22, 32);
INSERT INTO askfeup.PerguntaTag	VALUES (23, 32);
INSERT INTO askfeup.PerguntaTag	VALUES (24, 32);

INSERT INTO askfeup.PerguntaTag	VALUES (25, 37);
INSERT INTO askfeup.PerguntaTag	VALUES (26, 37);

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
/* (membroID, badgeID) */

/** Favoritas **/
/* (membroid, perguntaid) */
INSERT INTO askfeup.Favorita VALUES (1, 4);
INSERT INTO askfeup.Favorita VALUES (1, 8);
INSERT INTO askfeup.Favorita VALUES (2, 11);
INSERT INTO askfeup.Favorita VALUES (2, 29);

INSERT INTO askfeup.Favorita VALUES (2, 1);
INSERT INTO askfeup.Favorita VALUES (2, 8);
INSERT INTO askfeup.Favorita VALUES (2, 16);
INSERT INTO askfeup.Favorita VALUES (2, 37);

INSERT INTO askfeup.Favorita VALUES (3, 11);
INSERT INTO askfeup.Favorita VALUES (3, 26);
INSERT INTO askfeup.Favorita VALUES (3, 29);

INSERT INTO askfeup.Favorita VALUES (4, 1);
INSERT INTO askfeup.Favorita VALUES (4, 8);
INSERT INTO askfeup.Favorita VALUES (4, 29);

INSERT INTO askfeup.Favorita VALUES (7, 37);

INSERT INTO askfeup.Favorita VALUES (8, 26);

INSERT INTO askfeup.Favorita VALUES (9, 4);
INSERT INTO askfeup.Favorita VALUES (9, 16);

INSERT INTO askfeup.Favorita VALUES (10, 1);
INSERT INTO askfeup.Favorita VALUES (10, 4);
INSERT INTO askfeup.Favorita VALUES (10, 8);
INSERT INTO askfeup.Favorita VALUES (10, 11);

/** Notificações **/
INSERT INTO askfeup.Notificacao VALUES (1, 1, 1);
INSERT INTO askfeup.Notificacao VALUES (2, 1, 2);

/** Votos **/
/* (positivo, idMembro, idContribuiçao */

/* Pergunta 1 */
INSERT INTO askfeup.Voto VALUES ('true', 2, 1);
INSERT INTO askfeup.Voto VALUES ('true', 3, 1);
INSERT INTO askfeup.Voto VALUES ('true', 4, 1);
INSERT INTO askfeup.Voto VALUES ('false', 8, 1);

INSERT INTO askfeup.Voto VALUES ('false', 1, 2);
INSERT INTO askfeup.Voto VALUES ('false', 3, 2);
INSERT INTO askfeup.Voto VALUES ('false', 4, 2);

INSERT INTO askfeup.Voto VALUES ('true', 1, 3);
INSERT INTO askfeup.Voto VALUES ('false', 4, 3);

/* Pergunta 2 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 4);
INSERT INTO askfeup.Voto VALUES ('true', 3, 4);
INSERT INTO askfeup.Voto VALUES ('true', 2, 4);
INSERT INTO askfeup.Voto VALUES ('true', 7, 4);
INSERT INTO askfeup.Voto VALUES ('true', 8, 4);
INSERT INTO askfeup.Voto VALUES ('false', 9, 4);
INSERT INTO askfeup.Voto VALUES ('false', 10, 4);

INSERT INTO askfeup.Voto VALUES ('true', 2, 5);
INSERT INTO askfeup.Voto VALUES ('true', 3, 5);
INSERT INTO askfeup.Voto VALUES ('false', 4, 5);
INSERT INTO askfeup.Voto VALUES ('false', 7, 5);
INSERT INTO askfeup.Voto VALUES ('false', 8, 5);

INSERT INTO askfeup.Voto VALUES ('true', 1, 6);
INSERT INTO askfeup.Voto VALUES ('true', 2, 6);
INSERT INTO askfeup.Voto VALUES ('true', 4, 6);
INSERT INTO askfeup.Voto VALUES ('true', 7, 6);
INSERT INTO askfeup.Voto VALUES ('true', 10, 6);

INSERT INTO askfeup.Voto VALUES ('true', 1, 7);
INSERT INTO askfeup.Voto VALUES ('false', 4, 7);

/* Pergunta 3 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 8);
INSERT INTO askfeup.Voto VALUES ('true', 2, 8);
INSERT INTO askfeup.Voto VALUES ('true', 3, 8);
INSERT INTO askfeup.Voto VALUES ('true', 4, 8);
INSERT INTO askfeup.Voto VALUES ('true', 7, 8);
INSERT INTO askfeup.Voto VALUES ('true', 8, 8);

INSERT INTO askfeup.Voto VALUES ('true', 1, 9);
INSERT INTO askfeup.Voto VALUES ('true', 2, 9);
INSERT INTO askfeup.Voto VALUES ('true', 3, 9);
INSERT INTO askfeup.Voto VALUES ('true', 4, 9);

INSERT INTO askfeup.Voto VALUES ('true', 1, 10);
INSERT INTO askfeup.Voto VALUES ('true', 3, 10);
INSERT INTO askfeup.Voto VALUES ('true', 4, 10);
INSERT INTO askfeup.Voto VALUES ('true', 7, 10);
INSERT INTO askfeup.Voto VALUES ('true', 8, 10);
INSERT INTO askfeup.Voto VALUES ('true', 9, 10);
INSERT INTO askfeup.Voto VALUES ('false', 10, 10);

/* Pergunta 4 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 11);
INSERT INTO askfeup.Voto VALUES ('true', 3, 11);
INSERT INTO askfeup.Voto VALUES ('true', 4, 11);
INSERT INTO askfeup.Voto VALUES ('true', 7, 11);
INSERT INTO askfeup.Voto VALUES ('false', 8, 11);
INSERT INTO askfeup.Voto VALUES ('false', 9, 11);

INSERT INTO askfeup.Voto VALUES ('false', 10, 12);
INSERT INTO askfeup.Voto VALUES ('false', 9, 12);
INSERT INTO askfeup.Voto VALUES ('false', 1, 12);

INSERT INTO askfeup.Voto VALUES ('true', 1, 13);
INSERT INTO askfeup.Voto VALUES ('true', 2, 13);
INSERT INTO askfeup.Voto VALUES ('true', 7, 13);
INSERT INTO askfeup.Voto VALUES ('true', 8, 13);

/* Pergunta 5 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 14);
INSERT INTO askfeup.Voto VALUES ('true', 2, 14);

INSERT INTO askfeup.Voto VALUES ('true', 7, 15);
INSERT INTO askfeup.Voto VALUES ('true', 8, 15);
INSERT INTO askfeup.Voto VALUES ('true', 10, 15);

/* Pergunta 6 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 16);
INSERT INTO askfeup.Voto VALUES ('true', 2, 16);
INSERT INTO askfeup.Voto VALUES ('true', 3, 16);
INSERT INTO askfeup.Voto VALUES ('true', 4, 16);
INSERT INTO askfeup.Voto VALUES ('true', 7, 16);
INSERT INTO askfeup.Voto VALUES ('false', 10, 16);

INSERT INTO askfeup.Voto VALUES ('false', 1, 17);
INSERT INTO askfeup.Voto VALUES ('false', 3, 17);
INSERT INTO askfeup.Voto VALUES ('false', 4, 17);
INSERT INTO askfeup.Voto VALUES ('false', 8, 17);
INSERT INTO askfeup.Voto VALUES ('true', 9, 17);

INSERT INTO askfeup.Voto VALUES ('false', 1, 18);
INSERT INTO askfeup.Voto VALUES ('false', 2, 18);
INSERT INTO askfeup.Voto VALUES ('false', 4, 18);
INSERT INTO askfeup.Voto VALUES ('false', 7, 18);

INSERT INTO askfeup.Voto VALUES ('true', 1, 19);
INSERT INTO askfeup.Voto VALUES ('true', 2, 19);
INSERT INTO askfeup.Voto VALUES ('false', 3, 19);
INSERT INTO askfeup.Voto VALUES ('false', 7, 19);
INSERT INTO askfeup.Voto VALUES ('false', 8, 19);
INSERT INTO askfeup.Voto VALUES ('false', 9, 19);
INSERT INTO askfeup.Voto VALUES ('false', 10, 19);

INSERT INTO askfeup.Voto VALUES ('true', 2, 20);
INSERT INTO askfeup.Voto VALUES ('true', 3, 20);
INSERT INTO askfeup.Voto VALUES ('true', 4, 20);
INSERT INTO askfeup.Voto VALUES ('true', 8, 20);
INSERT INTO askfeup.Voto VALUES ('true', 7, 20);

/* Pergunta 7 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 21);
INSERT INTO askfeup.Voto VALUES ('true', 2, 21);
INSERT INTO askfeup.Voto VALUES ('true', 3, 21);
INSERT INTO askfeup.Voto VALUES ('true', 8, 21);
INSERT INTO askfeup.Voto VALUES ('true', 9, 21);

INSERT INTO askfeup.Voto VALUES ('true', 1, 22);
INSERT INTO askfeup.Voto VALUES ('true', 3, 22);
INSERT INTO askfeup.Voto VALUES ('true', 4, 22);

INSERT INTO askfeup.Voto VALUES ('true', 1, 23);
INSERT INTO askfeup.Voto VALUES ('true', 2, 23);

INSERT INTO askfeup.Voto VALUES ('true', 8, 24);

INSERT INTO askfeup.Voto VALUES ('true', 1, 25);
INSERT INTO askfeup.Voto VALUES ('true', 2, 25);
INSERT INTO askfeup.Voto VALUES ('false', 8, 25);
INSERT INTO askfeup.Voto VALUES ('false', 9, 25);
INSERT INTO askfeup.Voto VALUES ('false', 10, 25);

/* Pergunta 8 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 26);
INSERT INTO askfeup.Voto VALUES ('true', 2, 26);
INSERT INTO askfeup.Voto VALUES ('true', 4, 26);
INSERT INTO askfeup.Voto VALUES ('false', 9, 26);
INSERT INTO askfeup.Voto VALUES ('false', 10, 26);

INSERT INTO askfeup.Voto VALUES ('false', 1, 27);
INSERT INTO askfeup.Voto VALUES ('true', 9, 27);
INSERT INTO askfeup.Voto VALUES ('true', 8, 27);
INSERT INTO askfeup.Voto VALUES ('true', 10, 27);
INSERT INTO askfeup.Voto VALUES ('true', 3, 27);

INSERT INTO askfeup.Voto VALUES ('true', 1, 28);
INSERT INTO askfeup.Voto VALUES ('false', 2, 28);

/* Pergunta 9 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 29);
INSERT INTO askfeup.Voto VALUES ('true', 2, 29);
INSERT INTO askfeup.Voto VALUES ('true', 3, 29);

INSERT INTO askfeup.Voto VALUES ('true', 1, 30);
INSERT INTO askfeup.Voto VALUES ('true', 3, 30);
INSERT INTO askfeup.Voto VALUES ('true', 4, 30);

INSERT INTO askfeup.Voto VALUES ('true', 2, 31);
INSERT INTO askfeup.Voto VALUES ('false', 3, 31);

/* Pergunta 10 */
INSERT INTO askfeup.Voto VALUES ('true', 1, 32);
INSERT INTO askfeup.Voto VALUES ('true', 2, 32);
INSERT INTO askfeup.Voto VALUES ('true', 3, 32);
INSERT INTO askfeup.Voto VALUES ('true', 4, 32);
INSERT INTO askfeup.Voto VALUES ('true', 7, 32);
INSERT INTO askfeup.Voto VALUES ('true', 8, 32);
INSERT INTO askfeup.Voto VALUES ('false', 10, 32);

INSERT INTO askfeup.Voto VALUES ('true', 9, 33);

INSERT INTO askfeup.Voto VALUES ('true', 9, 34);

INSERT INTO askfeup.Voto VALUES ('true', 9, 35);

INSERT INTO askfeup.Voto VALUES ('true', 9, 36);
INSERT INTO askfeup.Voto VALUES ('false', 1, 36);
INSERT INTO askfeup.Voto VALUES ('false', 2, 36);
INSERT INTO askfeup.Voto VALUES ('false', 3, 36);

/* Pergunta 11 */
INSERT INTO askfeup.Voto VALUES ('true', 2, 37);
INSERT INTO askfeup.Voto VALUES ('true', 3, 37);
INSERT INTO askfeup.Voto VALUES ('true', 4, 37);

INSERT INTO askfeup.Voto VALUES ('true', 1, 38);
INSERT INTO askfeup.Voto VALUES ('true', 3, 38);
INSERT INTO askfeup.Voto VALUES ('true', 4, 38);

INSERT INTO askfeup.Voto VALUES ('true', 1, 39);
INSERT INTO askfeup.Voto VALUES ('true', 2, 39);
INSERT INTO askfeup.Voto VALUES ('true', 3, 39);

/** Recuperações de Password **/
/* (id, codigo, data, membro) */
INSERT INTO askfeup.RecuperacaoDePassword VALUES (1, 'umastringdepass', '2015-04-29 22:32:00', 1);
INSERT INTO askfeup.RecuperacaoDePassword VALUES (2, 'blablabla', '2015-04-30 01:54:00', 2);

/** Visualizações **/
/* (membroID, perguntaID) */
/* Pergunta 1 */
INSERT INTO askfeup.Visualizacao VALUES (2, 1);
INSERT INTO askfeup.Visualizacao VALUES (3, 1);
INSERT INTO askfeup.Visualizacao VALUES (4, 1);
INSERT INTO askfeup.Visualizacao VALUES (8, 1);

/* Pergunta 2 */
INSERT INTO askfeup.Visualizacao VALUES (1, 4);
INSERT INTO askfeup.Visualizacao VALUES (2, 4);
INSERT INTO askfeup.Visualizacao VALUES (3, 4);
INSERT INTO askfeup.Visualizacao VALUES (7, 4);
INSERT INTO askfeup.Visualizacao VALUES (8, 4);
INSERT INTO askfeup.Visualizacao VALUES (9, 4);
INSERT INTO askfeup.Visualizacao VALUES (10, 4);

/* Pergunta 3 */
INSERT INTO askfeup.Visualizacao VALUES (1, 8);
INSERT INTO askfeup.Visualizacao VALUES (2, 8);
INSERT INTO askfeup.Visualizacao VALUES (3, 8);
INSERT INTO askfeup.Visualizacao VALUES (4, 8);
INSERT INTO askfeup.Visualizacao VALUES (7, 8);
INSERT INTO askfeup.Visualizacao VALUES (8, 8);
INSERT INTO askfeup.Visualizacao VALUES (9, 8);

/* Pergunta 4 */
INSERT INTO askfeup.Visualizacao VALUES (1, 11);
INSERT INTO askfeup.Visualizacao VALUES (3, 11);
INSERT INTO askfeup.Visualizacao VALUES (4, 11);
INSERT INTO askfeup.Visualizacao VALUES (7, 11);
INSERT INTO askfeup.Visualizacao VALUES (8, 11);
INSERT INTO askfeup.Visualizacao VALUES (9, 11);
INSERT INTO askfeup.Visualizacao VALUES (10, 11);

/* Pergunta 5 */
INSERT INTO askfeup.Visualizacao VALUES (1, 14);
INSERT INTO askfeup.Visualizacao VALUES (2, 14);
INSERT INTO askfeup.Visualizacao VALUES (8, 14);
INSERT INTO askfeup.Visualizacao VALUES (9, 14);
INSERT INTO askfeup.Visualizacao VALUES (10, 14);

/* Pergunta 6 */
INSERT INTO askfeup.Visualizacao VALUES (1, 16);
INSERT INTO askfeup.Visualizacao VALUES (2, 16);
INSERT INTO askfeup.Visualizacao VALUES (3, 16);
INSERT INTO askfeup.Visualizacao VALUES (4, 16);
INSERT INTO askfeup.Visualizacao VALUES (7, 16);
INSERT INTO askfeup.Visualizacao VALUES (9, 16);
INSERT INTO askfeup.Visualizacao VALUES (10, 16);

/* Pergunta 7 */
INSERT INTO askfeup.Visualizacao VALUES (1, 21);
INSERT INTO askfeup.Visualizacao VALUES (2, 21);
INSERT INTO askfeup.Visualizacao VALUES (3, 21);
INSERT INTO askfeup.Visualizacao VALUES (7, 21);
INSERT INTO askfeup.Visualizacao VALUES (8, 21);
INSERT INTO askfeup.Visualizacao VALUES (9, 21);
INSERT INTO askfeup.Visualizacao VALUES (10, 21);

/* Pergunta 8 */
INSERT INTO askfeup.Visualizacao VALUES (1, 26);
INSERT INTO askfeup.Visualizacao VALUES (2, 26);
INSERT INTO askfeup.Visualizacao VALUES (4, 26);
INSERT INTO askfeup.Visualizacao VALUES (7, 26);
INSERT INTO askfeup.Visualizacao VALUES (8, 26);
INSERT INTO askfeup.Visualizacao VALUES (9, 26);
INSERT INTO askfeup.Visualizacao VALUES (10, 26);

/* Pergunta 9 */
INSERT INTO askfeup.Visualizacao VALUES (1, 29);
INSERT INTO askfeup.Visualizacao VALUES (2, 29);
INSERT INTO askfeup.Visualizacao VALUES (3, 29);
INSERT INTO askfeup.Visualizacao VALUES (4, 29);

/* Pergunta 10 */
INSERT INTO askfeup.Visualizacao VALUES (1, 32);
INSERT INTO askfeup.Visualizacao VALUES (2, 32);
INSERT INTO askfeup.Visualizacao VALUES (3, 32);
INSERT INTO askfeup.Visualizacao VALUES (4, 32);
INSERT INTO askfeup.Visualizacao VALUES (7, 32);
INSERT INTO askfeup.Visualizacao VALUES (8, 32);
INSERT INTO askfeup.Visualizacao VALUES (10, 32);

/* Pergunta 11 */
INSERT INTO askfeup.Visualizacao VALUES (2, 37);
INSERT INTO askfeup.Visualizacao VALUES (3, 37);
INSERT INTO askfeup.Visualizacao VALUES (4, 37);
