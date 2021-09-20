<?php
session_start();
if (isset($_POST['login'])) {
    include("../includes/db.php");
    function login($pdo, $login, $password)
    {
        $result = $pdo->query("SELECT * FROM auction.users WHERE login='$login' AND password='$password' AND admin='1'");
        $myrow = $result->fetch(PDO::FETCH_ASSOC);
        if (!empty($myrow['id'])) {
            return true;
        } else {
            unset($_SESSION['login'], $_SESSION['password']);
            return false;
        }
    }

    if (isset($_POST['login']) and isset($_POST['password'])) {
        $_SESSION['login'] = $_POST['login'];
        $_SESSION['password'] = $_POST['password'];
    }
    if (isset($_SESSION['login']) and isset($_SESSION['password'])) {
        if (login($pdo, $_SESSION['login'], $_SESSION['password']) === true) $_SESSION['permission'] = "admin";
    }
}