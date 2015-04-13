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
INSERT INTO askfeup.Contribuicao VALUES (1, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (2, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (3, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (4, '2015-04-15 22:32:00', 0, 0, 0, 1);


INSERT INTO	askfeup.Contribuicao VALUES (5, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (6, '2015-04-15 22:32:00', 0, 0, 0, 1);
INSERT INTO askfeup.Contribuicao VALUES (7, '2015-04-15 22:32:00', 0, 0, 0, 1);

/** BadgeMembro **/
INSERT INTO askfeup.BadgeMembro	VALUES (1,1);
INSERT INTO askfeup.BadgeMembro	VALUES (2,1);
INSERT INTO askfeup.BadgeMembro	VALUES (5,1);
INSERT INTO askfeup.BadgeMembro	VALUES (1,2);
INSERT INTO askfeup.BadgeMembro	VALUES (3,2);

/** PerguntaTag **/
INSERT INTO askfeup.PerguntaTag	VALUES (1,1);
INSERT INTO askfeup.PerguntaTag	VALUES (1,2);
INSERT INTO askfeup.PerguntaTag	VALUES (2,3);
INSERT INTO askfeup.PerguntaTag	VALUES (3,1);
INSERT INTO askfeup.PerguntaTag	VALUES (3,3);

INSERT INTO askfeup.tag(tagid, nome)
	VALUES (1,'D.Beatriz');
INSERT INTO askfeup.tag(tagid, nome)
	VALUES (2,'Gomas');
INSERT INTO askfeup.tag(tagid, nome)
	VALUES (3,'Horário');


INSERT INTO askfeup.categoria(categoriaid,tipo)
	VALUES (1,'Lazer');
INSERT INTO askfeup.categoria(categoriaid,tipo)
	VALUES (2,'Culinária');
INSERT INTO askfeup.categoria(categoriaid,tipo)
	VALUES (3,'Emprego');


INSERT INTO askfeup.badge(badgeid,nome,descricao)
	VALUES (1,'First Doubt', 'Ask a Question!');
INSERT INTO askfeup.badge(badgeid,nome,descricao)
	VALUES (2,'Wise Crack', 'Give an Answer!');

INSERT INTO askfeup.favorita VALUES (1,1);
INSERT INTO askfeup.favorita VALUES (1,2);
INSERT INTO askfeup.favorita VALUES (2,2);

INSERT INTO askfeup.notificacao(1,1,1);
INSERT INTO askfeup.notificacao(2,1,2);


INSERT INTO askfeup.voto('true',3,1);
INSERT INTO askfeup.voto('true',4,2);

INSERT INTO askfeup.recuperacaodepassword VALUES (1,'umastringdepass','2015-04-15 22:32:00',1);
INSERT INTO askfeup.recuperacaodepassword VALUES (2,'umastringdepass','2015-04-15 22:32:00',2);


