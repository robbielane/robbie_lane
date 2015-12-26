$(document).ready(function() {
  $(document).on('click', '.clickable', function() {
    var contentID = $(this).data('id');
    loadContent(contentID)
  })
});

function loadContent(id) {
  $('#robbie').toggle();
  $('#recent-activity').toggle();
  $.ajax({
    type: 'GET',
    url: '/api/v1/posts/' + id + '.json',
    success: function(content) {
      $('#content').append(
        "<h1>" + content.title + "</h1>" +
        "<p>" + content.body + "</p>"
      )
    }
  })
};
