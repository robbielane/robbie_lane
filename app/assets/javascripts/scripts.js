$(document).ready(function() {
  $('.clickable').on('click', function() {
    window.document.location = $(this).data('link');
  });

  $("#editor").crevasse({
    previewer: $("#preview")
  });
});