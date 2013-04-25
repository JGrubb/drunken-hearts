// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(function($){
  $('a.btn-navbar').bind('click', function(){
    var nav = $('nav#main');
    console.log(nav.height());
    if(nav.hasClass('visible')) {
      nav.slideUp(150).removeClass('visible');
    } else {
      nav.slideDown(150).addClass('visible');
    }
  });
  $('a.dropdown-toggle').bind('click', function() {
   $(this).next('.dropdown-menu').css('display', 'block');
  });
});
