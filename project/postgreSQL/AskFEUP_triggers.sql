/** AskFEUP **/
/** Triggers **/

.headers ON
.mode columns

CREATE TRIGGER rightAnswer INSTEAD OF UPDATE OF correcta
	ON Resposta
	WHEN ((New.correcta = true) AND ((SELECT COUNT(*) FROM 
		(	SELECT correcta FROM Resposta 
			WHERE correcta=true			)
		) > 0 ) );
	BEGIN
	END;
