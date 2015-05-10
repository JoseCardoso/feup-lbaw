<?php

class Model {
    static function query($query = '', $params) {
        global $connection;
        $stmt = $connection->prepare($query);
        $stmt->execute($params);
        return $stmt;
    }
}