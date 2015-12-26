$(document).ready(function() {
  $.ajax({
    type: 'GET',
    url: '/api/v1/posts.json',
    success: function(posts) {
      $.each(posts, function(index, post) {
        $('.posts').append(
          "<div class='post clickable' data-id=" +
          post.id + "><h5>" + post.title + "</h5>" +
          "<p>" + post.body + "</p></div>"
        )
      })
    }
  });
});
