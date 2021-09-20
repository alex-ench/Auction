<?php
if (isset($_POST['title'])) {
    if (($_FILES['image']['type'] == 'image/gif' or $_FILES['image']['type'] == 'image/jpeg' or $_FILES['image']['type'] == 'image/png') and ($_FILES['image']['size'] != 0 and $_FILES['image']['size'] <= 2048000)) {
        $size = getimagesize($_FILES['image']['tmp_name']);
        if ($size[0] < 1001 && $size[1] < 1001) {
            include("../includes/db.php");
            date_default_timezone_set('Europe/Ulyanovsk');
            $randname = md5(microtime());
            $name = $randname . "." . substr($_FILES['image']['type'], 6);
            $location = "../lots/images/" . $name;
            move_uploaded_file($_FILES['image']['tmp_name'], $location);
            $title = stripslashes(htmlspecialchars(trim($_POST['title'])));
            $final_cost = stripslashes(htmlspecialchars(trim($_POST['final-cost'])));
            $expires = strtotime(date('d.m.Y H:i', strtotime($_POST['expires'])));
            $upload = $pdo->query("INSERT INTO auction.lots (title,final_cost,expires,image) VALUES('$title','$final_cost','$expires','$name')");
            header("DB_SUCCESS: 1");
        } else header("DB_SUCCESS: 2");
    } else header("DB_SUCCESS: 3");
}