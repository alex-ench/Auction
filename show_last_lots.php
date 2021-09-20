<?php
if (isset($_POST['show_last_lots'])) {
    include("includes/db.php");
    $result = $pdo->query("SELECT * FROM auction.lots WHERE status='active' ORDER BY id DESC limit 5;");
    $lots = $result->fetchAll();
    echo "<div class='promo-container'>";
    foreach ($lots as $lot) {
        $id = $lot['id'];
        $title = $lot['title'];
        $final_cost = $lot['final_cost'];
        $expires = $lot['expires'];
        $image = $lot['image'];
        echo "<div class='column'>
            <div class='offer-container'>
                <a href='offer.php?id=$id' class='item-photo'>
                    <div class='mainpage-offer-photo-container'>
                        <img class='img-responsive' src='lots/images/$image' alt='$title'>
                    </div>
                </a>
                    <a href='offer.php?id=$id' class='item-title'>
                        <div class='title-box'>$title</div>
                    </a>
                <span class='item-sub'><span class='item-price'>$final_cost<span>&#8381;</span></span></span>
            </div>
          </div>";
    }
    echo "</div>";
}