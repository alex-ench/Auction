<?php
session_start();
?>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <title>Auction</title>
    <meta name="description" content="Аукцион">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="auction.svg" type="image/x-icon">
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript" src="js/jquery.maskedinput.min.js"></script>
    <script>
        $.ajax({
            url: 'show_last_lots.php',
            type: 'POST',
            data: 'show_last_lots',
            success: function (response) {
                $("#container-for-last-viewed-offers .last-lots").html(response);
                $('#container-for-last-viewed-offers').slideDown(400);
            },
            error: function (response) {
                console.log(response);
            },
        });
        $(function () {
            $("#tel").mask("+7(999) 999-9999");
        });</script>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="container">
            <div class="navigation">
                <div class="collapse navbar-collapse" id="globalNavbar">
                    <span>
                        <a href="" class="show-lots" id="show-all-lots">Все лоты</a>
                    </span>
                </div>
                <?php
                if (!isset($_SESSION['login'])) {
                    ?>
                    <div id="rightNavbar">
                        <span style="padding-right: 10px">
                            <input type="button" value="Регистрация" id="reg">
                        </span>
                        <span>
                            <input type="button" value="Войти" id="log">
                        </span>
                    </div>
                    <div class="registration" style="display: none">
                        <form action="" method="post" class="reg-form">
                            <div class="reg-form">
                                <label for="email">E-mail:</label>
                                <input type="email" name="email" id="email" size="16" maxlength="50"
                                       placeholder="Электронная почта" required="required">
                            </div>
                            <div class="reg-form">
                                <label for="login">Логин:</label>
                                <input type="text" name="login" id="login" size="16" maxlength="16" placeholder="Логин"
                                       required="required">
                            </div>
                            <div class="reg-form">
                                <label for="password">Пароль:</label>
                                <input type="password" name="password" id="password" size="16" maxlength="16"
                                       placeholder="Пароль" autocomplete="on" required="required">
                            </div>
                            <div class="reg-form">
                                <label for="tel">Номер телефона:</label>
                                <input type="tel" name="tel" id="tel" size="11" maxlength="12" autofocus="autofocus"
                                       placeholder="+7(___) ___-____" required="required">
                            </div>
                            <div class="reg-form">
                                <input type="submit" name="submit" value="Регистрация">
                            </div>
                        </form>
                    </div>
                    <div class="auth" style="display: none">
                        <form action="" method="post" class="auth-form">
                            <div class="auth-form">
                                <label for="login">Логин: </label>
                                <input type="text" name="login" id="login" size="16" maxlength="16" placeholder="Логин">
                            </div>
                            <div class="auth-form">
                                <label for="password">Пароль:</label>
                                <input type="password" name="password" id="password" size="15" maxlength="15"
                                       placeholder="Пароль" autocomplete="on">
                            </div>
                            <div class="auth-form">
                                <input type="submit" name="submit" value="Войти">
                            </div>
                        </form>
                    </div>
                    <?php
                } else {
                    echo "<div id='rightNavbar'><input type='button' value='{$_SESSION['login']}' id='mini-profile'></div>";
                    ?>
                    <div class="mini-profile" style="display: none">
                        <div class="auth-form"><a href='users/my_actions.php?login=<?= $_SESSION['login'] ?>'>Мои
                                лоты</a></div>
                        <form action="" method="post" class="logout-form">
                            <input type="submit" name="submit" value="Выйти">
                        </form>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
    </nav>
</header>
<div class="container" id="items">
    <div id="container-for-last-viewed-offers" class="new-items" style="display: none">
        <div class="container-title">Последние добавленные лоты</div>
        <div class="last-lots"></div>
    </div>
</div>
<div class="container" id="items">
    <div id="container-for-all-offers" class="all-items" style="display: none">
        <div class="container-title">Все лоты</div>
        <div class="all-lots"></div>
    </div>
</div>
<div class="popup-fade">
    <div class="popup">
        <p></p>
    </div>
</div>
<div class="popup-fade-notification">
    <div class="popup-notification">
        <p></p>
    </div>
</div>
</body>
</html>