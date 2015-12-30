$(document).ready(function() {
  $.ajax({
    type: 'GET',
    url: 'http://localyost:3000/api/v1/recent.json',
    success: function(posts) {
      $.each(posts, function(index, post) {
        $('.photos').append(
          "<div id='photo_" + index + "' class='photo clickable' data-id=''" + "><h5>" + post.name + "</h5>" + "<p>" + post.description + "</p></div>"
        )
        $("#photo_" + index).css("background-image", "url(" + post.h_thumb_url + ")")
      })
    }
  });
});
