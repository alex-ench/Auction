<?php
session_start();
if (isset($_SESSION['login'])) {
    ?>
    <html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Ваши ставки</title>
        <meta name="description" content="Ваши ставки">
        <link rel="stylesheet" href="../css/styles.css">
        <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="../js/scripts.js"></script>
    </head>
    <body>
    <header>
        <nav class="navbar">
            <div class="container">
                <div class="navigation">
                    <div class="collapse navbar-collapse" id="globalNavbar">
                    <span>
                        <a href="../index.php" class="main-page">Главная страница</a>
                    </span>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <div class="container" id="items">
        <div id="container-for-user-offers" class="new-items">
            <?php include 'show_user_lots.php' ?>
        </div>
    </div>
    <div class="popup-fade">
        <div class="popup">
            <p></p>
        </div>
    </div>
    </body>
    </html>
    <?php
}
?>