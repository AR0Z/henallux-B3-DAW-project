(function ($) {
    "use strict";
    new WOW().init();

    $(window).on('load', function () {
        dataBackgroundImage();
    });
    /*swiper container activation*/
    var swiper = new Swiper('.slider_swiper', {
        clickable: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    $('#nav-tab a').on('click', function (e) {
        e.preventDefault()
        $(this).tab('show')
    })
})(jQuery);
