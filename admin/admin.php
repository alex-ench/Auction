<?php
session_start();
include("../includes/db.php");
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="shortcut icon" href="../auction.svg" type="image/x-icon">
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/admin.js"></script>
</head>
<body>
<?php
if (isset($_SESSION['permission']) and $_SESSION['permission'] == 'admin') {
    ?>
    <header>
        <nav class="navbar">
            <div class="container">
                <div class="navigation">
                    <div class="collapse navbar-collapse" id="globalNavbar">
                        <span>
                            <a href="../index.php" class="main-page">Главная страница</a>
                        </span>
                    </div>
                    <div id='rightNavbar'><input type='button' value='<?= $_SESSION['login'] ?>' id='mini-profile'>
                    </div>
                    <div class="mini-profile" style="display: none">
                        <form action="" method="post" class="logout-form">
                            <input type="submit" name="submit" value="Выйти">
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <?php
}
?>
<div class='container'>
    <?php
    if (!isset($_SESSION['permission'])) {
        ?>
        <div class='wrapper'>
            <div class='wrapper-container'>
                <div class='title'>Войти в панель администратора</div>
                <form method='post' id='login-form' class='login-form'>
                    <input type='text' placeholder='Логин' class='input' name='login' required='required'>
                    <input type='password' placeholder='Пароль' class='input' name='password'
                           required='required'>
                    <input type='submit' value='Войти' class='button'>
                </form>
            </div>
        </div>
        <?php
    } else {
    ?>
    <div class="container" id="admin-panel">
        <div class="container-for-functions">
            <div class="container-title">Функции</div>
            <div class="container" id="functions">
                <div class="container-for-functions">
                    <div class="container-title">Создать лот</div>
                    <div class="upload-lot">
                        <form action="" method="post" enctype='multipart/form-data' class="create-lot">
                                <span class="item">
                                    <label for="title">Название лота</label>
                                    <input type="text" name="title" id="title" size="16" maxlength="100"
                                           required="required">
                                </span>
                            <span class="item">
                                    <label for="final-cost">Стоимость мгновенной продажи</label>
                                    <input type="text" name="final-cost" id="final-cost" size="16" maxlength="45"
                                           required="required">
                                </span>
                            <span class="item">
                                    <label for="expires">Конец торгов</label>
                                    <input type="datetime-local" name="expires" id="expires"
                                           size="16" maxlength="45" required="required">
                                </span>
                            <span class="item">
                                    <label for="image">Загрузить фотографию:</label>
                                    <input type="file" name="image" id="image" size="16" maxlength="45"
                                           required="required">
                                </span>
                            <span class="item">
                                    <button type="submit" name="sender">Загрузить</button>
                                </span>
                        </form>
                    </div>
                </div>
            </div>
            <div class="container" id="functions">
                <?php include 'output_all_users.php' ?>
                <?php include 'output_all_actions.php' ?>
            </div>
        </div>
        <div class="container" id="functions">
                <?php include 'output_all_lots.php' ?>
        </div>
    </div>
</div>
    <div class="popup-fade">
        <div class="popup">
            <p></p>
        </div>
    </div>
<?php
}
?>
</div>
</body>
</html>