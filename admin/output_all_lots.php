<?php
$result = $pdo->query("SELECT * FROM auction.lots");
$lots = $result->fetchAll();
if ($lots) {
    date_default_timezone_set('Europe/Ulyanovsk');
    $num = 0;
    $info_array = array("id", "title", "final_cost", "expires", "max_bet", "max_bet_login", "image", "status");
    echo "<div class='container-for-functions'><div class='container-title'>Управление лотами</div><div class='container-function'><table class='output-all-lots'><tr>";
    foreach ($info_array as $value) {
        echo "<td>$value</td>";
    }
    echo "<td>Cancel</td><td>Delete</td></tr>";
    foreach ($lots as $lot) {
        $id = $lot['id'];
        $status = $lot['status'];
        if ($status === 'cancel') echo "<tr class='lots cancel' id='$id'>";
        else echo "<tr class='lots' id='$id'>";
        foreach ($lot as $key => $value) {
            if (in_array($key, $info_array) and $key !== 0) {
                if ($key === 'expires') {
                    if ($value === '0') $date = "Лот отменён"; else $date = date('Y-m-d H:i', $value);
                    echo "<td>$date</td>";
                } else echo "<td>$value</td>";
            }
        }
        if ($status === 'active') {
            echo "<td><input type='button' value='Cancel' class='lot-interact' id='cancel-lot' data-itemid='$id'></td>";
        }
        if ($status === 'cancel') {
            echo "<td><input type='button' value='Resume' class='lot-interact' id='resume-lot' data-itemid='$id'></td>";
        }
        if ($status === 'done') {
            echo "<td><input type='button' value='Done' class='lot-interact' id='done-lot' disabled></td>";
        }
        echo "<td><input type='button' value='❌' class='lot-interact' id='del-lot' data-itemid='$id'></td></tr>";
    }
    echo "</table></div></div>";
}