$(document).ready( () => {
  $.ajax({
    type: 'GET',
    url: 'http://photography.robbielane.me/api/v1/recent.json',
    success: (posts) => {
      $.each(posts, function(index, post) {
        $('.photos').append(
          `<div id='photo_${index}' class='photo'>
            <h5>${post.name}</h5>
            <p>${post.description}</p>
          </div>`
        )
        $("#photo_" + index ).css("background-image", "url(" + post.h_thumb_url + ")")
        $("#photo_" + index).attr("data-link", "http://photography.robbielane.me" + post.picture_uri)
        $("#photo_" + index).attr("data-timestamp", post.created_at)
        $('.photo').on('click', function() {
          window.document.location = $(this).data('link');
        });
      })
    }
  });
});
