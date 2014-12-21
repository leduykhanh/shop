<?php
require_once "config/define.php";
$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
	}
$mysqli->close();

?>