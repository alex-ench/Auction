<?php
if (isset($_POST['itemid'])) {
    include("../includes/db.php");
    date_default_timezone_set('Europe/Ulyanovsk');
    $date = new DateTime();
    $date->add(new DateInterval('P7D'));
    $expires = strtotime($date->format('d.m.Y H:i'));
    $itemid = $_POST['itemid'];
    $pdo->exec("UPDATE auction.lots SET expires='$expires', status='active' WHERE id='$itemid'");
    print_r($date->format('d.m.Y H:i'));
}