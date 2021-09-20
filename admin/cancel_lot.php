<?php
if (isset($_POST['itemid'])) {
    include("../includes/db.php");
    $itemid = $_POST['itemid'];
    $pdo->exec("UPDATE auction.lots SET expires='0', status='cancel' WHERE id='$itemid'");
}