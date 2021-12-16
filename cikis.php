<?php
session_start();
session_unset();
session_destroy();
unset($_COOKIE['giris']);
setcookie("giris",null);
$_SESSION = array();
header('Location: /');
ob_end_flush();
