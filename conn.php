<?php
$dsn = 'mysql:host=localhost;dbname=macbildirim;charset=utf8';
$user = 'macbildirim';
$pass = 'CA*////****';

try {
    $db = new PDO($dsn,$user,$pass);
}catch (PDOException $e)
{
    echo $e->getMessage();
}
$db->query("set Character set utf8");