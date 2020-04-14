<?php

$dbhost = '127.0.0.1';
$dbuname = 'root';
$dbpass = '';
$dbname = 'league';



$dbo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);

?>