<?php
session_start();
if (isset($_POST['login'])) {
    include("../includes/db.php");
    $login = $_POST['login'];
    $password = $_POST['password'];
    $login = stripslashes(htmlspecialchars(trim($login)));
    $password = stripslashes(htmlspecialchars(trim($password)));
    $result = $pdo->query("SELECT * FROM users WHERE login='$login'");
    $myrow = $result->fetch(PDO::FETCH_ASSOC);
    if (!empty($myrow['password']) and $myrow['password'] === $password) {
        $_SESSION['id'] = $myrow['id'];
        $_SESSION['login'] = $myrow['login'];
        header("DB_SUCCESS: 1");
    } else header("DB_SUCCESS: 0");
}