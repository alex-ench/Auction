<?php
include("../includes/db.php");
$email = stripslashes(htmlspecialchars(trim($_POST['email'])));
$login = stripslashes(htmlspecialchars(trim($_POST['login'])));
$password = stripslashes(htmlspecialchars(trim($_POST['password'])));
$telephone = stripslashes(htmlspecialchars(trim($_POST['tel'])));
$check_email = $pdo->query("SELECT * FROM auction.users WHERE email = '$email'")->fetch(PDO::FETCH_BOTH);
$check_login = $pdo->query("SELECT * FROM auction.users WHERE login = '$login'")->fetch(PDO::FETCH_BOTH);
if ($check_email) {
    header("DB_SUCCESS: 2");
    exit();
}
if ($check_login) {
    header("DB_SUCCESS: 3");
    exit();
}
$send = $pdo->query("INSERT INTO auction.users (email,login,password,telephone) VALUES('$email','$login','$password','$telephone')");
if ($send) {
    header("DB_SUCCESS: 1");
    exit();
} else {
    header("DB_SUCCESS: 0");
    exit();
}