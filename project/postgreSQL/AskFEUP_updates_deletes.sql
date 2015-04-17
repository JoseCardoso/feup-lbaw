/** AskFEUP **/
/** Updates **/

/* Editar campos de utilizador */
UPDATE askfeup.Utilizador
SET askfeup.Utilizador.username = $newUsername, askfeup.Utilizador.password = $newPassword
WHERE (askfeup.Utilizador.idUtilizador = $idUser
	AND NOT EXISTS (SELECT * FROM askfeup.Utilizador WHERE askfeup.Utilizador.username = $newUsername));

/* Editar campos de membro */
UPDATE askfeup.Membro
SET askfeup.Membro.primeiroNome = $newFirstName, askfeup.Membro.ultimoNome = $newLastName, askfeup.Membro.email = $newEmail
WHERE askfeup.Membro.idMembro = $idUser;

/* Editar uma pergunta */
UPDATE askfeup.Pergunta
SET askfeup.Pergunta.texto = $newQuestionContent, askfeup.Pergunta.descricao = $newQuestionDescription
WHERE askfeup.PErgunta.idPergunta = $idQuestion;

/* Editar uma resposta */
UPDATE askfeup.Resposta
SET askfeup.Resposta.descricao = $newAnswerDescription
WHERE askfeup.Resposta.idResposta = $idResposta;

/* Editar comentário */
UPDATE askfeup.Comentario
SET askfeup.Comentario.descricao = $newCommentDescription
WHERE askfeup.Comentario.idComentario = $idComment;

/** Deletes **/

/* Apagar um utilizador */
DELETE FROM askfeup.Utilizador
WHERE askfeup.Utilizador.idUtilizador = $idUser;

/* Apagar uma pergunta */
DELETE FROM askfeup.Pergunta
WHERE askfeup.Pergunta.idPergunta = $idPergunta;

/* Apagar uma respostas */
DELETE FROM askfeup.Resposta
WHERE askfeup.Resposta.idResposta = $idResposta;

/* Apagar um comentário */
DELETE FROM askfeup.Comentario
WHERE askfeup.Comentario.idComentario = $idComentario;