<?php
date_default_timezone_set('Europe/Ulyanovsk');
include("../includes/db.php");
$result = $pdo->query("SELECT * FROM auction.participants WHERE login='{$_SESSION['login']}'");
$participant = $result->fetchAll(PDO::FETCH_ASSOC);
if (!empty($participant)) {
    $total_spent = 0;
    foreach ($participant as $num_lot => $lot) {
        $total_spent = $total_spent + $lot['bet'];
        $result = $pdo->query("SELECT * FROM auction.lots WHERE id='{$participant[$num_lot]['id_lot']}'");
        $lots[$num_lot] = $result->fetchAll(PDO::FETCH_ASSOC);
    }
    echo "<div class='container-title'>Ваши ставки | Всего потрачено: $total_spent<span>&#8381;</span></div><div class='all-lots'>";
    $number_column = 0;
    foreach ($lots as $num_lot => $lot) {
        foreach ($lot as $values) {
            if ($number_column === 0) {
                echo "<div class='promo-container'>";
            }
            echo "<div class='column'><div class='offer-container'>";
            $id = $values['id'];
            $title = $values['title'];
            $final_cost = $values['final_cost'];
            $expires = $values['expires'];
            $max_bet = $values['max_bet'];
            $max_bet_login = $values['max_bet_login'];
            $image = $values['image'];
            $status = $values['status'];
            echo "<a href='../offer.php?id=$id' class='item-photo'>
                    <div class='mainpage-offer-photo-container'>
                        <img class='img-responsive' src='../lots/images/$image' alt='$title'>
                    </div>
                    </a>
                    <a href='../offer.php?id=$id' class='item-title'>
                        <div class='title-box'>$title</div>
                    </a>
                    ";
            if ($status === 'done') {
                if ($max_bet_login === $_SESSION['login']) {
                    echo "<span class='item-sub'><span class='item-price'>Вы выиграли. </span><span class='item-price'>Ваша ставка: {$participant[$num_lot]['bet']}<span>&#8381;</span></span></div></div>";
                } else {
                    echo "<span class='item-sub'><span class='item-price'>Вы проиграли. </span><span class='item-price'>Ваша ставка: {$participant[$num_lot]['bet']}<span>&#8381;</span></span></div></div>";
                }
            }
            if ($status === 'active') {
                echo "<span class='item-sub'><span class='item-price'>Ваша ставка: {$participant[$num_lot]['bet']}<span>&#8381;</span></span></span></div></div>";
            }
            if ($status === 'cancel') {
                echo "<span class='item-sub'><span class='item-price'>Лот отменён. </span><span class='item-price'>Ваша ставка: {$participant[$num_lot]['bet']}<span>&#8381;</span></span></div></div>";
            }
            $number_column++;
            if ($number_column === 5) {
                echo "</div>";
                $number_column = 0;
            }
        }
    }
} else echo "<div class='container-title'>Вы ещё не участвовали в лотах</div><div class='content promo-container'>";
echo "</div></div>";