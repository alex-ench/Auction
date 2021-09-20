<?php
if (isset($_POST['itemid'])) {
    include("../includes/db.php");
    $itemid = $_POST['itemid'];
    $result = $pdo->query("SELECT * FROM auction.lots WHERE id='$itemid'");
    $myrow = $result->fetch(PDO::FETCH_BOTH);
    $image = $myrow['image'];
    $location = "../lots/images/" . $image;
    unlink($location);
    $pdo->exec("DELETE FROM auction.lots WHERE id='$itemid'");
    $pdo->exec("DELETE FROM auction.participants WHERE id_lot='$itemid'");
}