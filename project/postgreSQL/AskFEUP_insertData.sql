/** AskFEUP **/
/** Insert Data **/

/** Utilizadores **/

INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("1", "botas", "lbaw");
INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("2", "ferrolho", "lbaw");
INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("3", "betao", "lbaw");
INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("4", "zoid", "lbaw");
INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("5", "olamundo", "admin1234");
INSERT INTO Utilizador (utilizadorID, username, password) VALUES ("6", "lbaw1424", "olamundo");

/** Administradores **/
INSERT INTO Administrador (administradorID) VALUES ("5");
INSERT INTO Administrador (administradorID) VALUES ("6");

/** Cidades **/
INSERT INTO Cidade (cidadeID, nome, codigoPostal) VALUES ("1", "Porto", 4200);
INSERT INTO Cidade (cidadeID, nome, codigoPostal) VALUES ("2", "Barcelos", 4750);
INSERT INTO Cidade (cidadeID, nome, codigoPostal) VALUES ("3", "Braga", 4705);
INSERT INTO Cidade (cidadeID, nome, codigoPostal) VALUES ("4", "Viseu", 3500);

/** Membros **/
INSERT INTO Membro (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, membroID, cidadeID)
	VALUES ("true", "João", "Pereira", "ei12023@fe.up.pt", 0, '2015-04-13 04:14:00', '2015-04-13 04:15:00', "1", "2");
INSERT INTO Membro (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, membroID, cidadeID)
	VALUES ("true", "Henrique", "Ferrolho", "ei12079@fe.up.pt", 0, '2015-04-14 12:05:00', '2015-04-16 00:01:00', "2", "4");
INSERT INTO Membro (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, membroID, cidadeID)
	VALUES ("true", "José", "Cardoso", "ei12027@fe.up.pt", 0, '2015-04-14 15:14:00', '2015-04-17 04:18:00', "3", "1");
INSERT INTO Membro (activo, primeiroNome, ultimoNome, email, pontos, registo, ultimoLogin, membroID, cidadeID)
	VALUES ("true", "Gabriel", "Souto", "ei12087@fe.up.pt", 0, '2015-04-14 20:14:00', '2015-04-20 04:15:00', "4", "1");


INSERT INTO Contribuicao (contribuicaoID, data, diferencaVotos, votosNegativos, votosPositivos, membroID) 
	VALUES ("1", "2015-04-15 22:32:00", "0", "0", "0", "1");

