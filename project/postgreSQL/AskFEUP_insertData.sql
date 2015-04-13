/** AskFEUP **/
/** Insert Data **/

/** Utilizadores **/

INSERT INTO askfeup.Utilizador VALUES (1, "botas", "lbaw");
INSERT INTO askfeup.Utilizador VALUES (2, 'ferrolho', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (3, 'betao', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (4, 'zoid', 'lbaw');
INSERT INTO askfeup.Utilizador VALUES (5, 'olamundo', 'admin1234');
INSERT INTO askfeup.Utilizador VALUES (6, 'lbaw1424', 'olamundo');

/** Administradores **/
INSERT INTO askfeup.Administrador VALUES (5);
INSERT INTO askfeup.Administrador VALUES (6);

/** Cidades **/
INSERT INTO askfeup.Cidade VALUES (1, 'Porto', 4200);
INSERT INTO askfeup.Cidade VALUES (2, 'Barcelos', 4750);
INSERT INTO askfeup.Cidade VALUES (3, 'Braga', 4705);
INSERT INTO askfeup.Cidade VALUES (4, 'Viseu', 3500);

/** Membros **/
INSERT INTO askfeup.Membro VALUES ('true', 'João', 'Pereira', 'ei12023@fe.up.pt', 0, '2015-04-13 04:14:00', '2015-04-13 04:15:00', 1, 2);
INSERT INTO askfeup.Membro VALUES ('true', 'Henrique', 'Ferrolho', 'ei12079@fe.up.pt', 0, '2015-04-14 12:05:00', '2015-04-16 00:01:00', 2, 4);
INSERT INTO askfeup.Membro VALUES ('true', 'José', 'Cardoso', 'ei12027@fe.up.pt', 0, '2015-04-14 15:14:00', '2015-04-17 04:18:00', 3, 1);
INSERT INTO askfeup.Membro VALUES ('true', 'Gabriel', 'Souto', 'ei12087@fe.up.pt', 0, '2015-04-14 20:14:00', '2015-04-20 04:15:00', 4, 1);

/** Contribuições **/
INSERT INTO askfeup.Contribuicao VALUES (1, '2015-04-15 22:32:00', 0, 0, 0, 2);
INSERT INTO askfeup.Contribuicao VALUES (2, '2015-04-16 22:32:00', 0, 0, 0, 4);
INSERT INTO askfeup.Contribuicao VALUES (5, '2015-04-17 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (6, '2015-04-18 22:32:00', 0, 0, 0, 3);


INSERT INTO	askfeup.Contribuicao VALUES (3, '2015-04-16 23:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (4, '2015-04-17 23:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (7, '2015-04-18 23:32:00', 0, 0, 0, 1);

/** Categorias **/
INSERT INTO askfeup.Categoria VALUES (1, 'Lazer');
INSERT INTO askfeup.Categoria VALUES (2, 'Desporto');
INSERT INTO askfeup.Categoria VALUES (3, 'Emprego');
INSERT INTO askfeup.Categoria VALUES (4, 'Comida');

/** Perguntas **/
INSERT INTO askfeup.Pergunta VALUES (1, 'A D. Beatriz vende gomas?', '', 4);
INSERT INTO askfeup.Pergunta VALUES (3, 'Sabem se podemos alugar o pavilhão Luís de Falcão?', 'Lá não tem informações.', 2);

/** Respostas **/
INSERT INTO askfeup.Resposta VALUES (2, 'false', 'Nao vende.', 1);
INSERT INTO askfeup.Resposta VALUES (4, 'false', 'Nao, é proibido.', 3);
INSERT INTO askfeup.Resposta VALUES (5, 'true', 'LOL. Vende sim.', 1);
INSERT INTO askfeup.Resposta VALUES (6, 'true', 'Podes sim, mas tens de marcar.', 3);
INSERT INTO askfeup.Resposta VALUES (7, 'false', 'Olha que acho que não, só no Campus.', 1);

/** Badges **/
INSERT INTO askfeup.Badge VALUES (1, 'First Doubt', 'Ask a Question!');
INSERT INTO askfeup.Badge VALUES (2, 'Wise Crack', 'Give an Answer!');

/** BadgeMembro **/
INSERT INTO askfeup.BadgeMembro	VALUES (1, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (2, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (5, 1);
INSERT INTO askfeup.BadgeMembro	VALUES (1, 2);
INSERT INTO askfeup.BadgeMembro	VALUES (3, 2);

/** Tags **/
INSERT INTO askfeup.Tag VALUES (1, 'D.Beatriz');
INSERT INTO askfeup.Tag VALUES (2, 'Gomas');
INSERT INTO askfeup.Tag VALUES (3, 'Horário');

/** PerguntaTag **/
INSERT INTO askfeup.PerguntaTag	VALUES (1, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (1, 2);
INSERT INTO askfeup.PerguntaTag	VALUES (2, 3);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 1);
INSERT INTO askfeup.PerguntaTag	VALUES (3, 3);

/** Favoritas **/
INSERT INTO askfeup.Favorita VALUES (1, 1);
INSERT INTO askfeup.Favorita VALUES (1, 2);
INSERT INTO askfeup.Favorita VALUES (2, 2);

/** Notificações **/
INSERT INTO askfeup.Notificacao(1, 1, 1);
INSERT INTO askfeup.Notificacao(2, 1, 2);

/** Votos **/
INSERT INTO askfeup.Voto('true', 3, 1);
INSERT INTO askfeup.Voto('true', 4, 2);

/** Recup+erações de Password **/
INSERT INTO askfeup.RecuperacaoDePassword VALUES (1, 'umastringdepass', '2015-04-15 22:32:00', 1);
INSERT INTO askfeup.RecuperacaoDePassword VALUES (2, 'umastringdepass', '2015-04-15 22:32:00', 2);

/** Comemtários **/
INSERT INTO askfeup.Comentario VALUES (1, '2015-04-15 22:32:00', 'Tens um bom ponto!', 1, 4);
INSERT INTO askfeup.Comentario VALUES (2, '2015-04-15 22:32:00', 'Tens de melhorar a tua pontuação!', 2, 5);

/** Visualizações **/
INSERT INTO askfeup.Visualizacao VALUES (3, 1);
INSERT INTO askfeup.Visualizacao VALUES (4, 2);
