$(document).ready(function () {
    /*function infinitely() {
        $.ajax({
            url: '../includes/check_complete_lots.php',
            method: 'POST',
            data: 'refresh'
        });
        setTimeout(infinitely, 60000);
    }
    infinitely();*/
    $('.login-form').submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: 'check_admin.php',
            type: 'POST',
            data: $('.login-form').serialize(),
            success: function () {
                window.location.reload();
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    $('.create-lot').submit(function (event) {
        event.preventDefault();
        let form_data = new FormData();
        let file_data = $('#image')[0].files[0];
        let info = $('.create-lot').serializeArray();
        $.each(info, function (key, input) {
            form_data.append(input.name, input.value);
        });
        form_data.append('image', file_data);
        $.ajax({
            url: 'upload_lot.php',
            type: 'POST',
            data: form_data,
            contentType: false,
            processData: false,
            success: function (response, status, xhr) {
                $('.popup-fade').fadeIn();
                if (xhr.getResponseHeader("DB_SUCCESS") == 1) {
                    $(".popup p").html("Лот добавлен.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                        window.location.reload();
                    }, 1000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 2) {
                    $(".popup p").html("Загружаемое изображение превышает допустимые нормы (ширина не более - 1000; высота не более 1000).");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 1000);
                }
                if (xhr.getResponseHeader("DB_SUCCESS") == 3) {
                    $(".popup p").html("Файл имеет неподдерживаемый формат.");
                    setTimeout(function () {
                        $('.popup-fade').fadeOut();
                    }, 1000);
                }
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    $('.output-all-users').on('click', '.del-user', function () {
        let userid = $(this).data('userid');
        $.ajax({
            url: 'remove_user.php',
            type: 'POST',
            data: {'userid': userid},
            success: function () {
                $('tr.user#' + userid).remove();
                $(".popup p").html("Пользователь id: " + userid + " удалён.");
                setTimeout(function () {
                    $('.popup-fade').fadeOut();
                }, 2000);
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    let output_all_lots = $('.output-all-lots');
    output_all_lots.on('click', '#cancel-lot', function () {
        let itemid = $(this).data('itemid');
        $.ajax({
            url: 'cancel_lot.php',
            type: 'POST',
            data: {'itemid': itemid},
            success: function () {
                $(".lot-interact#cancel-lot[data-itemid='" + itemid + "']").val("Resume").prop('id', 'resume-lot');
                $('tr.lots#' + itemid).addClass('cancel');
                $('tr.lots#' + itemid + ' td:eq(3)').html("Лот отменён");
                $('tr.lots#' + itemid + ' td:eq(7)').html("cancel");
                $('.popup-fade').fadeIn();
                $(".popup p").html("Лот отменён.");
                setTimeout(function () {
                    $('.popup-fade').fadeOut();
                }, 1000);
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    output_all_lots.on('click', '#resume-lot', function () {
        let itemid = $(this).data('itemid');
        $.ajax({
            url: 'resume_lot.php',
            type: 'POST',
            data: {'itemid': itemid},
            success: function (response) {
                $(".lot-interact#resume-lot[data-itemid='" + itemid + "']").val("Cancel").prop('id', 'cancel-lot');
                $('tr.lots#' + itemid).removeClass('cancel');
                $('tr.lots#' + itemid + ' td:eq(3)').html(response);
                $('tr.lots#' + itemid + ' td:eq(7)').html("active");
                $('.popup-fade').fadeIn();
                $(".popup p").html("Лот возобновлён.");
                setTimeout(function () {
                    $('.popup-fade').fadeOut();
                }, 1000);
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    output_all_lots.on('click', '#del-lot', function () {
        let itemid = $(this).data('itemid');
        $.ajax({
            url: 'remove_lot.php',
            type: 'POST',
            data: {'itemid': itemid},
            success: function () {
                $('.lots#' + itemid).remove();
                $('.popup-fade').fadeIn();
                $(".popup p").html("Лот удалён.");
                setTimeout(function () {
                    $('.popup-fade').fadeOut();
                }, 1000);
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
    $('.logout-form').submit(function (event) {
        event.preventDefault();
        $.ajax({
            url: '../users/logout.php',
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
    $('#mini-profile').click(function () {
        $('.mini-profile').slideToggle(300);
    });
})