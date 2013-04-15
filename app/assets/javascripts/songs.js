// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(function(){
  $('.song a').click(function(e){
    if(document.getElementById('active')) {
      var current = document.getElementById('active');
      current.id = null;
    }
    var player = document.getElementById('player');
    player.src = $(this).data('source');
    player.controls = true;
    player.autoplay = true;
    e.target.parentElement.id = "active";
    e.preventDefault();
  });
});