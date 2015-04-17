/** AskFEUP **/
/** Updates **/

/* Editar campos de utilizador */
UPDATE askfeup.Utilizador
SET askfeup.Utilizador.username = $newUsername, askfeup.Utilizador.password = $newPassword
WHERE (askfeup.Utilizador.idUtilizador = $idUser
	AND NOT EXISTS (SELECT * FROM askfeup.Utilizador WHERE askfeup.Utilizador.username = $newUsername));

/* Editar uma resposta */

/* Editar uma pergunta */

/* Editar comentário */


/** Deletes **/

/* Apagar um utilizador */

/* Apagar uma pergunta */

/* Apagar uma respostas */

/* Apagar um comentário */