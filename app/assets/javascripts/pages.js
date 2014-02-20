// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(function($){
  $('a.btn-navbar').on('click', function(){
    var nav = $('nav#main');
    nav.insertAfter('#logo');
    nav.slideToggle(150).toggleClass('visible');
  });
  var centerLogo = function() {
    $('html.home #logo h1').css({
      'position' : 'absolute',
      'left' : function() {
        var winWidth = window.document.width;
        var logoWidth = $('#logo h1').width();
        return (winWidth - logoWidth) / 2;
      },
      'top' : function() {
        var winHeight = window.document.height;
        var logoHeight = $('#logo h1').height();
        return (winHeight - logoHeight) / 2;
      },
      'margin' : 0
    });
  };
  centerLogo();
  $(window).resize(centerLogo);
});
