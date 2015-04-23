/** AskFEUP **/
/** Updates **/

/* Editar campos de utilizador */
UPDATE askfeup.Utilizador
SET askfeup.Utilizador.username = $newUsername, askfeup.Utilizador.password = $newPassword
WHERE (askfeup.Utilizador.utilizadorID = $idUser
	AND NOT EXISTS (SELECT * FROM askfeup.Utilizador WHERE askfeup.Utilizador.username = $newUsername));

/* Editar campos de membro */
UPDATE askfeup.Membro
SET askfeup.Membro.primeiroNome = $newFirstName, askfeup.Membro.ultimoNome = $newLastName, askfeup.Membro.email = $newEmail
WHERE askfeup.Membro.membroID = $idUser;

/* Editar uma pergunta */
UPDATE askfeup.Pergunta
SET askfeup.Pergunta.texto = $newQuestionContent, askfeup.Pergunta.descricao = $newQuestionDescription
WHERE askfeup.PErgunta.perguntaID = $idQuestion;

/* Editar uma resposta */
UPDATE askfeup.Resposta
SET askfeup.Resposta.descricao = $newAnswerDescription
WHERE askfeup.Resposta.respostaID = $idAnswer;

/* Editar comentário */
UPDATE askfeup.Comentario
SET askfeup.Comentario.descricao = $newCommentDescription
WHERE askfeup.Comentario.comentarioID = $idComment;

/** Deletes **/

/* Apagar um utilizador */
DELETE FROM askfeup.Utilizador
WHERE askfeup.Utilizador.utilizadorID = $idUser;

/* Apagar uma pergunta */
DELETE FROM askfeup.Pergunta
WHERE askfeup.Pergunta.perguntaID = $idQuestion;

/* Apagar uma respostas */
DELETE FROM askfeup.Resposta
WHERE askfeup.Resposta.respostaID = $idAnswer;

/* Apagar um comentário */
DELETE FROM askfeup.Comentario
WHERE askfeup.Comentario.comentarioID = $idComment;
