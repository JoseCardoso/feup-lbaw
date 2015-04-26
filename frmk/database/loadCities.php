<?php

function loadCities() {
	global $connection;
	$stmt = $connection->prepare("SELECT nome, codigopostal FROM cidade ORDER BY nome");
	$stmt->execute();
	return $stmt->fetchAll(PDO::FETCH_GROUP|PDO::FETCH_ASSOC);
}
function loadZIPByCity() {
    global $connection;
    $stmt = $connection->prepare("SELECT codigopostal FROM cidade WHERE nome = ? GROUP BY nome ORDER BY nome");
    $stmt->execute();
    return $stmt->fetchAll();
}
?>
