// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require refinerycms-pods
//= require jquery.colorbox
//= require jquery_nested_form
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {

      $('.open-menu').on('click', function() {        
         $('#overlay').addClass('open');
      });
     
      $('.close-menu').on('click', function() {
        $('#overlay').removeClass('open');
      });



    $(".cboxElement").colorbox({
        maxWidth: "90%",
        maxHeight: "90%"
    });

    //$(".datepicker_it").datepicker({ format: "yyyy-mm-dd", autoclose: true });

//  $(".activity_video_url").colorbox({iframe:true, innerWidth:640, innerHeight:390, transition:"elastic"});

    $('.carousel').carousel();

    $('.submit_booking').on('click', function(){
        if ($('.accept').is(":checked")) {
        }
        else {
            alert('Please checked the Acceptance Box');
            return false;
        }
    });


////////////////////////////////////////////////////////////////////////////////////
    $('.bxsliderSafari').bxSlider({
        minSlides: 0,
        maxSlides: 5,
        slideWidth: 218,
        slideMargin: 5,
        auto: false,
        moveSlides:1,
        infiniteLoop:false,
        pager: false,
        autoHover: true,
        controls: true,
        nextSelector: '.safari-slider-next',
        prevSelector: '.safari-slider-prev',
        nextText: ' ',
        prevText: ' '
    });

    $('.bxsliderExperience').bxSlider({
        minSlides: 0,
        maxSlides: 1,
        slideWidth: 1110,
        slideMargin: 5,
        auto: false,
        moveSlides:1,
        infiniteLoop:false,
        pager: false,
        autoHover: true,
        controls: true,
        nextSelector: '.experience-slider-next',
        prevSelector: '.experience-slider-prev',
        nextText: ' ',
        prevText: ' '
    });

    var slider = new MasterSlider();

    slider.control('arrows');

    slider.setup('masterslider' , {
        width:1920,
        height:970,
        space:0,
        layout:'fullwidth',
        loop:true,
        preload:0,
        autoplay:true,
        view:'fade',
        overPause:false
    });

    $('.navbar').scrollupbar();


    $window = $(window);
    $window.scroll(function() {
        if ( $window.scrollTop() <= 120 ) {
            $('.navbar').removeClass('navbar-scroll');
        }
        else {
            $('.navbar').addClass('navbar-scroll');
        }
    });

////////////////////////////////////////////////////////////////////////////////////

  // var slider = new MasterSlider();
  //
  // slider.control('arrows');
  //
  // slider.setup('masterslider' , {
  //   width:1920,
  //   height:935,
  //   space:0,
  //   layout:'fullwidth',
  //   loop:true,
  //   preload:0,
  //   autoplay:true,
  //   view:'fade',
  //   overPause:false
  // });

    var post_slider = new MasterSlider();

    //slider.control('arrows');

    post_slider.setup('post_masterslider' , {
        width:1920,
        height:935,
        space:0,
        layout:'fullwidth',
        loop:true,
        preload:0,
        autoplay:true,
        view:'fade',
        overPause:false
    });

    var slider2 = new MasterSlider();

    slider2.control('arrows');

    slider2.setup('masterslider2' , {
        width:1920,
        height:935,
        space:1,
        layout:'fullwidth',
        loop:true,
        preload:0,
        autoplay:false,
        overPause:false,
        shuffle:false,
        instantStartLayers: true,
        view:"fade"
    });

    $(function(){
        $('.navbar-hamburger').click(function(){
            $('.navbar-hamburger').toggleClass('navbar-on');
            $('nav').fadeToggle();
            $('nav').removeClass('nav-hide');
        });
    });

    $(".read_more").click(function() {

        $(this).parent().parent().css("display", "none");
        $(".more_text").slideDown(600,"easeInOutQuad");

        return false;

    });


    $('a[href*=#]:not([href=#])').click(function() {
        $('.navbar-on').click();
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });

    $('.navbar-hamburger').click(function(){
        if (!$('.navbar-hamburger').hasClass('navbar-on')) {
            $('html, body').animate({scrollTop : 0},500);
            return false;
        }
    });

    $('.arrow').click(function() {
        $('html,body').animate({
            scrollTop: $('#welcome').offset().top
        }, 1000);
        return false;
    });


    $('.logo').click(function() {
        $('html,body').animate({
            scrollTop: $('#contact_area').offset().top
        }, 1000);
        return false;
    });



    $('#accommodations_slider').bxSlider({
        slideWidth: 165,
        slideMargin: 25,
        minSlides: 1,
        maxSlides: 6,
        moveSlides: 1,
        auto: false,
        pager: false,
        infiniteLoop: false,
        speed: 1000,
        pause: 6000
    });

    $('#locations_slider').bxSlider({
        slideWidth: 165,
        slideMargin: 25,
        minSlides: 1,
        maxSlides: 6,
        moveSlides: 1,
        auto: false,
        pager: false,
        infiniteLoop: false,
        speed: 1000,
        pause: 6000
    });

    $('.location_btn').click(function() {
        $('.location_nav').toggleClass('open');
    });

    var count = $('.truncate_text').children('p').length;
    if (count > 2){
        $( ".truncate_text > p:nth-child(3)").nextAll().addClass('hide_this_tag');
        $(".hide_this_tag").hide();
        $( ".truncate_text").append("<p style='text-align: center;'><a href='#' class='read_more_content btn btn-custom'>Read More</a></p>");
    }

    $('.read_more_content').click(function () {
        $(this).parent().siblings('.hide_this_tag').slideToggle();
        var $this = $(this);
        $this.toggleClass('.link');
        if($this.hasClass('.link')){
            $this.text('Read Less');
        } else {
            $this.text('Read More');
        }
        return false
    });

    ///////////////////////////////////////////

    WaterMark('input#inquiry_name','Name');
    WaterMark('input#inquiry_email','Email');
    WaterMark('input#inquiry_phone','Phone');
    WaterMark('input#inquiry_captcha','Enter code here');
    WaterMark('textarea#inquiry_message','Message');

});


function WaterMark(id_name,watermark){
    //init, set watermark text and class
    $(id_name).attr("placeholder",watermark).addClass('watermark');
    //if blur and no value inside, set watermark text and class again.
    $(id_name).blur(function(){
        if ($(this).attr("placeholder").length == 0){
            $(this).attr("placeholder", watermark).addClass('watermark');
        }
    });
    //if focus and text is watermrk, set it to empty and remove the watermark class
    $(id_name).focus(function(){
        if ($(this).attr("placeholder") == watermark){
            $(this).attr("placeholder",'').removeClass('watermark');
        }
    });
}

$(window).load(function() {

    var $container = $('.portfolio-isotope');
    // initialize
    $container.isotope({
        filter : ".portfolio-item",
        layoutMode: 'masonry'

    });
});

// new UISearch( document.getElementById( 'sb-search' ) );


