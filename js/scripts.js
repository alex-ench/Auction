$(document).ready(function () {
    $('.reg-form').submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'users/save_user.php',
            type: 'POST',
            data: $('.reg-form').serialize(),
            success: function (response, status, xhr) {
                $('.popup-fade').fadeIn();
                if (xhr.getResponseHeader("DB_SUCCESS") == 1) {
                    $(".popup p").html("Успешная регистрация.");
                    $('.registration').slideToggle(300);
                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 0) {
                    $(".popup p").html("Ошибка!");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 2) {
                    $(".popup p").html("E-mail уже существует.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 3) {
                    $(".popup p").html("Логин уже существует.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
            },
            error: function (response) {
                console.log(response);
            },
            complete: function (response) {
            }
        });
    });
    $('.auth-form').submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'users/check_user.php',
            type: 'POST',
            data: $('.auth-form').serialize(),
            success: function (response, status, xhr) {
                $('.popup-fade').fadeIn();
                if (xhr.getResponseHeader("DB_SUCCESS") == 1) {
                    $(".popup p").html("Добро пожаловать.");
                    $('.auth').slideToggle(300);
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                        window.location.reload();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 0) {
                    $(".popup p").html("Вы ввели неверный логин или пароль.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
            },
            error: function (response) {
                console.log(response);
            },
        });
    });
    let call_last_lots = true;
    let call_all_lots = true;
    $('.show-lots').click(function (event) {
        event.preventDefault();
        if ($(this).prop('id') === 'show-all-lots') {
            if (call_all_lots) {
                call_all_lots = false;
                $.ajax({
                    url: 'show_all_lots.php',
                    type: 'POST',
                    data: 'show_all_lots',
                    success: function (response) {
                        $("#container-for-all-offers .all-lots").html(response);
                        $('#container-for-last-viewed-offers').slideUp(400);
                        $('#container-for-all-offers').slideDown(400);
                        $('.show-lots').text('Недавно добавленные лоты').prop('id', 'show-last-lots');
                    },
                    error: function (response) {
                        console.log(response);
                    },
                });
            } else {
                $('#container-for-last-viewed-offers').slideUp(400);
                $('#container-for-all-offers').slideDown(400);
                $('.show-lots').text('Недавно добавленные лоты').prop('id', 'show-last-lots');
            }
        } else {
            if (call_last_lots) {
                call_last_lots = false;
                $.ajax({
                    url: 'show_last_lots.php',
                    type: 'POST',
                    data: 'show_last_lots',
                    success: function (response) {
                        $("#container-for-last-viewed-offers .last-lots").html(response);
                        $('#container-for-all-offers').slideUp(400);
                        $('#container-for-last-viewed-offers').slideDown(400);
                        $('.show-lots').text('Все лоты').prop('id', 'show-all-lots');
                    },
                    error: function (response) {
                        console.log(response);
                    },
                });
            } else {
                $('#container-for-all-offers').slideUp(400);
                $('#container-for-last-viewed-offers').slideDown(400);
                $('.show-lots').text('Все лоты').prop('id', 'show-all-lots');
            }
        }
    });
    $('.create-bet').submit(function (event) {
        event.preventDefault();
        let object = $('.my-value')
        let lotid = object.data('id-lot');
        let value = object.val();
        $.ajax({
            url: 'users/participate_lot.php',
            type: 'POST',
            data: {'lotid': lotid, 'value': value},
            success: function (response, status, xhr) {
                $('.popup-fade-participate').fadeOut();
                $('.popup-fade').fadeIn();
                if (xhr.getResponseHeader("DB_SUCCESS") == 1) {
                    $(".popup p").html("Ставка записана.");
                    $('participate').hide(100);
                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 0) {
                    $(".popup p").html("Вы уже сделали ставку.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 2) {
                    $(".popup p").html("Авторизуйтесь, чтобы сделать ставку.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 2000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 3) {
                    $(".popup p").html("Вы приобрели данный товар.");
                    $('participate').hide(100);
                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);
                }
            },
            error: function (response) {
                console.log(response);
            },
        });
    });
    $('.participate-btn-popup').click(function () {
        $('.popup-fade-participate').fadeIn();
    });
    $('.close-participation').click(function () {
        $('.popup-fade-participate').fadeOut();
    });
    $('.logout-form').submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'users/logout.php',
            type: 'POST',
            data: $('.logout-form').serialize(),
            success: function () {
                window.location.reload();
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    $('#log').click(function () {
        $('.auth').slideToggle(300);
        let reg = $('.registration');
        if (reg.is(':visible')) {
            reg.slideToggle(300);
        }
    });
    $('#reg').click(function () {
        $('.registration').slideToggle(300);
        let auth = $('.auth');
        if (auth.is(':visible')) {
            auth.slideToggle(300);
        }
    });
    $('#mini-profile').click(function () {
        $('.mini-profile').slideToggle(300);
    });
})