<?php
session_start();
if (isset($_SESSION['login'])) {
    include("../includes/db.php");
    $id_lot = $_POST['lotid'];
    $bet = $_POST['value'];
    $login = $_SESSION['login'];
    $check = $pdo->query("SELECT id FROM auction.participants WHERE login='$login' AND id_lot='$id_lot'")->fetch(PDO::FETCH_BOTH);
    if (empty($check['id'])) {
        $pdo->query("INSERT INTO auction.participants (id_lot,login,bet) VALUES('$id_lot','$login','$bet')");
        $lot = $pdo->query("SELECT * FROM auction.lots WHERE id='$id_lot'")->fetchAll(PDO::FETCH_BOTH);
        foreach ($lot as $values) {
            $max_bet = $values['max_bet'];
            $final_cost = $values['final_cost'];
            if ($bet > $max_bet) {
                $max_bet = $bet;
                $pdo->query("UPDATE auction.lots SET max_bet='$max_bet', max_bet_login='$login' WHERE id='$id_lot'");
            }
        }
        if ($bet === $final_cost) {
            $pdo->query("UPDATE auction.lots SET status='done' WHERE id='$id_lot'");
            header("DB_SUCCESS: 3");
        } else header("DB_SUCCESS: 1");
    } else header("DB_SUCCESS: 0");
} else header("DB_SUCCESS: 2");