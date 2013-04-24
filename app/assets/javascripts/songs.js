// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(function(){
  var player = document.getElementById('player');
  var src = $('.song:first a').data('source');
  player.autoplay = false;
  var mp3 = document.createElement('source');
  var ogg = document.createElement('source');
  mp3.src = src + '.mp3';
  mp3.id = 'mp3';
  ogg.src = src + '.ogg';
  ogg.id = 'ogg';
  player.appendChild(mp3);
  player.appendChild(ogg);

  $('.song a').click(function(e){
    if(document.getElementById('active')) {
      var current = document.getElementById('active');
      current.id = null;
    }
    var player = document.getElementById('player');
    document.getElementById('player-div').removeChild(player);
    player = document.createElement('audio');
    player.id = 'player';
    var src = $(this).data('source');
    var mp3 = document.createElement('source');
    var ogg = document.createElement('source');
    mp3.src = src + '.mp3';
    ogg.src = src + '.ogg';
    player.appendChild(mp3);
    player.appendChild(ogg);
    player.setAttribute('controls', true);
    document.getElementById('player-div').appendChild(player);
    player.play();
    e.target.parentElement.id = "active";
    e.preventDefault();
  });
});
