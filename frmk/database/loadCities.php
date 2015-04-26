<?php

function loadCities() {
	global $connection;
	$stmt = $connection->prepare("SELECT nome FROM cidade GROUP BY nome ORDER BY nome");
	$stmt->execute();
	return $stmt->fetchAll();
}
function loadZIPByCity() {
    global $connection;
    $stmt = $connection->prepare("SELECT codigopostal FROM cidade WHERE nome = ? GROUP BY nome ORDER BY nome");
    $stmt->execute();
    return $stmt->fetchAll();
}
?>
