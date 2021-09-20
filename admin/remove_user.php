<?php
if (isset($_POST['userid'])) {
    include("../includes/db.php");
    $userid = $_POST['userid'];
    $user = $pdo->query("SELECT * FROM auction.users WHERE id='$userid'")->fetch(PDO::FETCH_BOTH);
    $login = $user['login'];
    $pdo->exec("DELETE FROM auction.users WHERE id = '$userid'");
    $lots = $pdo->query("SELECT * FROM auction.participants WHERE login='$login'")->fetchAll();
    $pdo->exec("DELETE FROM auction.participants WHERE login='$login'");
    foreach ($lots as $lot) {
        $id_lot = $lot['id_lot'];
        $lots_participant = $pdo->query("SELECT * FROM auction.participants WHERE bet = (SELECT MAX(bet) FROM auction.participants WHERE id_lot='$id_lot')")->fetch(PDO::FETCH_BOTH);
        if ($lots_participant) {
            $max_bet_login = $lots_participant['login'];
            $max_bet = $lots_participant['bet'];
        } else {
            $max_bet_login = 0;
            $max_bet = 0;
        }
        $pdo->exec("UPDATE auction.lots SET max_bet='$max_bet', max_bet_login='$max_bet_login' WHERE id='$id_lot'");
    }
}