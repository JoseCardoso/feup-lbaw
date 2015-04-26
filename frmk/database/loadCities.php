<?php

function loadCities() {
	global $connection;
	$stmt = $connection->prepare("SELECT nome FROM cidade GROUP BY nome ORDER BY nome");
	$stmt->execute();
	return $stmt->fetchAll();
}

?>
