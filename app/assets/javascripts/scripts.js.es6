$(document).ready( () => {
  $('.clickable').on('click', function() {
    window.document.location = $(this).data('link');
  });

  $("#editor").crevasse({
    previewer: $("#preview")
  });

  $(document).keyup( (e) => {
     if (e.keyCode == 27) {
        window.document.location = '/login';
    }
  });
});
