<?php
$result = $pdo->query("SELECT * FROM auction.users");
$users = $result->fetchAll();
if ($users) {
	echo "<div class='container-for-functions'>
            <div class='container-title'>Управление пользователями</div>
            <div class='container-function'>'";
    $num = 0;
    $info_array = array("id", "email", "login", "password", "telephone", "admin");
    echo "<table class='output-all-users'><tr>";
    foreach ($info_array as $value) {
        echo "<td>$value</td>";
    }
    echo "<td>Delete</td></tr>";
    foreach ($users as $num_user => $user) {
        $id = $user['id'];
        echo "<tr class='user' id='$id'>";
        foreach ($user as $key => $value) {
            if (in_array($key, $info_array) and $key !== 0) echo "<td>$value</td>";
        }
        echo "<td><input type='button' value='❌' class='del-user' data-userid='$id'></td></tr>";
    }
    echo "</table></div></div>";
}