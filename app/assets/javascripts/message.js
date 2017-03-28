$(function() {

  function buildHTML(message){
    var html = (`<div class="content-center-ajax">
                  <p class=right-content-center__members-nickname>${ message.nickname }</p>
                  <p class=right-content-center__comment-time>${ message.created_at }</p>
                  <p class=right-content-center__comment>${ message.body }</p></div>`);
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var textField = $('.text-field');
    var message = textField.val();
    var path_name = location.pathname;
    $.ajax({
      type: 'POST',
      url: path_name,
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.right-content-center').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
