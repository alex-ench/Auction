<?php
//%progdir%\modules\php\%phpdriver%\php-win.exe -c %progdir%\modules\php\%phpdriver%\php.ini -q -f %sitedir%\Auction\includes\check_complete_lots.php
include("db.php");
date_default_timezone_set('Europe/Ulyanovsk');
$date_now = strtotime(date('Y-m-d H:i'));
$result = $pdo->query("SELECT * FROM auction.lots WHERE expires < {$date_now} AND status='active'");
$lots = $result->fetchAll();
if (!empty($lots)) {
    foreach ($lots as $lot) {
        $id = $lot['id'];
        $expires = $lot['expires'];
        if ($date_now >= $expires) {
            $pdo->exec("UPDATE auction.lots SET status='done' WHERE id='$id'");
        }
    }
}