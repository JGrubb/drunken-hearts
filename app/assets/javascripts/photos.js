// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(function(){
  $('#new_photo').fileupload({
    progress: function(e, data) {
      console.log(data);
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('.bar').css('width', progress + '%');
    }
  });
  $('#photos .photo a').fancybox({
    autoCenter: true,
    autoResize: true,
    autoWidth: true,
    helpers: {
      title: {
        type: 'outside'
      },
      thumbs: {
        width: 60,
        height: 60
      },
      overlay: {
        css: {
          'background' : 'rgba(58, 42, 45, 0.95)'
        }
      }
    }
  });
});