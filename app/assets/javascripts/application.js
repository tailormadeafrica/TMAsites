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
        touchEnabled: false,
        oneToOneTouch: false,
        minSlides: 0,
        maxSlides: 5,
        slideWidth: 218,
        slideMargin: 5,
        auto: false,
        moveSlides:1,
        infiniteLoop:true,
        pager: false,
        autoHover: true,
        controls: true,
        nextSelector: '.safari-slider-next',
        prevSelector: '.safari-slider-prev',
        nextText: ' ',
        prevText: ' '
    });

    $('.bxsliderExperience').bxSlider({
        touchEnabled: false,
        oneToOneTouch: false,
        minSlides: 0,
        maxSlides: 1,
        slideWidth: 1110,
        slideMargin: 5,
        auto: false,
        moveSlides:1,
        infiniteLoop:true,
        pager: false,
        autoHover: true,
        controls: true,
        nextSelector: '.experience-slider-next',
        prevSelector: '.experience-slider-prev',
        nextText: ' ',
        prevText: ' '
    });
    
        $('.bxsliderReviews').bxSlider({
  auto: false,
  autoControls: true,
  stopAutoOnClick: true,
  pager: true,
  slideWidth: 500
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


    var userFeed = new Instafeed({
        get: 'user',
        userId: '4158606615',
        accessToken: '4158606615.2d21024.925af79738bf440e9bb3785318afecd2',
        clientId: '2d210243e5fa4fa9b86944b079d87183',
        resolution: 'standard_resolution',
        template: '<a href="{{link}}" target="_blank" id="{{id}}"><img src="{{image}}"/><div class="footer"><div class="caption">{{caption}}</div></div></a>',
        sortBy: 'most-recent',
        limit: 5,
        links: false
    });
    userFeed.run();

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

    var post_slider2 = new MasterSlider();

    //slider.control('arrows');

    post_slider2.setup('post_masterslider2' , {
        width:1920,
        height:435,
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
        autoplay:true,
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
        touchEnabled: false,
        slideWidth: 165,
        slideMargin: 25,
        minSlides: 1,
        maxSlides: 6,
        moveSlides: 1,
        auto: true,
        pager: false,
        infiniteLoop: false,
        speed: 1000,
        pause: 6000
    });

    $('#locations_slider').bxSlider({
        touchEnabled: false,
        slideWidth: 165,
        slideMargin: 25,
        minSlides: 1,
        maxSlides: 6,
        moveSlides: 1,
        auto: true,
        pager: false,
        infiniteLoop: false,
        speed: 1000,
        pause: 6000
    });

    $('.location_btn').click(function() {
        $('.location_nav').toggleClass('open');
    });

    // var count = $('.truncate_text').children('p').length;
    // if (count > 2){
    //     $( ".truncate_text > p:nth-child(3)").nextAll().addClass('hide_this_tag');
    //     $(".hide_this_tag").hide();
    //     $( ".truncate_text").append("<p style='text-align: center;'><a href='#' class='read_more_content btn btn-custom'>Read More</a></p>");
    // }
    //
    // $('.read_more_content').click(function () {
    //     $(this).parent().siblings('.hide_this_tag').slideToggle();
    //     var $this = $(this);
    //     $this.toggleClass('.link');
    //     if($this.hasClass('.link')){
    //         $this.text('Read Less');
    //     } else {
    //         $this.text('Read More');
    //     }
    //     return false
    // });

    var showChar = 250;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Show more >";
    var lesstext = "Show less";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span><a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
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


// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


