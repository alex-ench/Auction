<?php
session_start();
date_default_timezone_set('Europe/Ulyanovsk');
include("includes/db.php");
$id_lot = $_GET['id'];
$result = $pdo->query("SELECT * FROM auction.lots WHERE id='$id_lot'");
$current_lot = $result->fetch(PDO::FETCH_ASSOC);
if ($current_lot) {
    $result1 = $pdo->query("SELECT * FROM auction.participants WHERE id_lot='$id_lot'");
    $current_lot_participants = $result1->fetchAll(PDO::FETCH_ASSOC);
    $max_bet = 0;
    if ($current_lot['max_bet'] > $max_bet) $max_bet = $current_lot['max_bet'];
    $status = $current_lot['status'];
    if ($status === 'active') {
        if (isset($_SESSION['login'])) {
            $show_button = true;
            $show_final_cost_expires_max_bet = true;
            if (!empty($current_lot_participants)) {
                foreach ($current_lot_participants as $participant) {
                    if ($participant['login'] === $_SESSION['login']) {
                        $show_button = false;
                        $show_final_cost_expires_max_bet = true;
                        $not_participate = "Ваша ставка: " . $participant['bet'] . "<span>&#8381;</span>";
                    }
                }
            } else {
                $show_button = true;
                $show_final_cost_expires_max_bet = true;
                $not_participate = "Ставок ещё нет";
            }
        } else {
            $show_button = false;
            $show_final_cost_expires_max_bet = true;
            $not_participate = "Войдите, чтобы сделать ставку";
        }
    }
    if ($status === 'done') {
        if ($current_lot['max_bet_login'] === $_SESSION['login']) {
            $show_final_cost_expires_max_bet = true;
            $not_participate = "Вы выиграли";
        }
        if ($current_lot['max_bet_login'] !== $_SESSION['login']) {
            $show_final_cost_expires_max_bet = false;
            $not_participate = "Лот завершён";
        }
        $show_button = false;
    }
    if ($status === 'cancel') {
        $show_button = false;
        $show_final_cost_expires_max_bet = false;
        $not_participate = "Лот отменён";
    }
    ?>
    <html lang="ru">
    <head>
        <meta charset="utf-8">
        <title><?= $current_lot['title'] ?></title>
        <meta name="description" content="<?= $current_lot['title'] ?>">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="shortcut icon" href="auction.svg" type="image/x-icon">
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/scripts.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput.min.js"></script>
        <script>$(function () {
                $("#tel").mask("+7(999) 999-9999");
            });</script>
    </head>
    <body>
    <header>
        <nav class="navbar">
            <div class="container">
                <div class="navigation">
                    <div class="collapse" id="globalNavbar">
                    <span>
                        <a href="index.php" class="main-page">Главная страница</a>
                    </span>
                    </div>
                    <?php if (!isset($_SESSION['login'])) { ?>
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
                                    <input type="text" name="login" id="login" size="16" maxlength="16"
                                           placeholder="Логин"
                                           required="required">
                                </div>
                                <div class="reg-form">
                                    <label for="password">Пароль:</label>
                                    <input type="password" name="password" id="password" size="16" maxlength="16"
                                           placeholder="Пароль" autocomplete="on" required="required">
                                </div>
                                <div class="reg-form">
                                    <label for="tel">Номер телефона:</label>
                                    <input type="tel" name="tel" id="tel" size="11" maxlength="12"
                                           autofocus="autofocus"
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
                                    <input type="text" name="login" id="login" size="16" maxlength="16"
                                           placeholder="Логин">
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
                    <?php } else {
                        echo "<div id='rightNavbar'><input type='button' value='{$_SESSION['login']}' id='mini-profile'></div>"; ?>
                        <div class="mini-profile" style="display: none">
                            <span><a href='users/my_actions.php?login=<?= $_SESSION['login'] ?>'>Мои лоты</a></span>
                            <form action="" method="post" class="logout-form">
                                <input type="submit" name="submit" value="Выйти">
                            </form>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </nav>
    </header>
    <div class="container" id="items">
        <div id="container-for-last-viewed-offers" class="new-items">
            <div class="container-title"><?= $current_lot['title'] ?></div>
            <div class="preview-container">
                <div class='offer-photo-container'>
                    <img class='img-responsive' src='lots/images/<?= $current_lot['image'] ?>'
                         alt='<?= $current_lot['title'] ?>'>
                </div>
                <div class="final-cost-expires-participate">
                    <?php if ($show_final_cost_expires_max_bet) { ?>
                        <div class='offer-final-cost-container'>
                            Цена моментальной покупки: <?= $current_lot['final_cost'] ?><span>&#8381;</span>
                        </div>
                        <div class='offer-expires-container'>
                            Дата окончания торгов: <?php echo date('Y-m-d H:i', $current_lot['expires']) ?>
                        </div>
                        <div class='offer-max-bet-container'>Максимальная ставка польователей:
                            <?php
                            if ($max_bet !== 0) {
                                echo $max_bet . "<span>&#8381;</span>";
                            } else echo "Ставок ещё нет";
                            ?>
                        </div>
                        <?php
                    }
                    if ($show_button) { ?>
                        <div class="participate">
                            <input type="button" value="Сделать ставку" class="participate-btn-popup">
                        </div>
                    <?php } else { ?>
                        <div class="participate"><?= $not_participate ?></div>
                    <?php }
                    ?>
                </div>
            </div>
        </div>
        <div class="popup-fade-participate">
            <div class="popup-participate">
                <span class="close-participation">✖</span>
                <div>
                    <div class="offer-photo-container"><img class="img-responsive"
                                                            src="lots/images/<?= $current_lot['image'] ?>">
                    </div>
                    <a class="offer-title"
                       href="offer.php?id=<?= $current_lot['id'] ?>"><?= $current_lot['title'] ?></a>
                </div>
                <div>
                    <form action="" method="post" class="create-bet">
                        <div class="offer-price">
                            <div class="title">Цена моментальной покупки:</div>
                            <div class="price"><?= $current_lot['final_cost'] ?><span>&#8381;</span></div>
                        </div>
                        <div>
                            <div style="cursor: pointer;">Ставка</div>
                            <input type="number" name="my-value" id="my-value" placeholder="Введите ставку"
                                   value="<?php echo $max_bet + 1; ?>" class="my-value"
                                   min="<?php echo $max_bet + 1; ?>" max="<?= $current_lot['final_cost'] ?>"
                                   step="1"
                                   data-id-lot="<?= $id_lot ?>">
                        </div>
                        <div><input type="submit" value="Сделать ставку" class="participate"></div>
                    </form>
                </div>
                <span>Дата окончания торгов:</span><br>
                <span><?php echo date('Y-m-d H:i', $current_lot['expires']) ?></span>
            </div>
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