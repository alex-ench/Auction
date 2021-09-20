<?php
$pdo = new PDO('mysql:dbname=auction;host=localhost:3306;', 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
//dbname=users — Название БД
//host=localhost:3306 — Адрес БД
//username и password от БД
?>