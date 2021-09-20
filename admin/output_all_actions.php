<?php
$result = $pdo->query("SELECT * FROM auction.participants");
$data = $result->fetchAll();
if ($data) {
    echo "<div class='container-for-functions'>
                    <div class='container-title'>Действия пользователей</div>
                    <div class='container-function'>";
    $num = 0;
    $info_array = array("id", "id_lot", "login", "bet");
    echo "<table class='output-all-actions'><tr>";
    foreach ($info_array as $value) {
        echo "<td>$value</td>";
    }
    echo "</tr>";
    foreach ($data as $item) {
        echo "<tr>";
        foreach ($item as $key => $str) {
            if (in_array($key, $info_array) and $key !== 0) echo "<td>$str</td>";
            if ($key === 'id') $id = $str;
        }
    }
    echo "</table></div></div>";
}