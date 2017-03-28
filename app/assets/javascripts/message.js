$(function() {
  function buildHTML(message) {
    var member_nickname = $("<p class=member-nickname> #{message.user.nickname}");
    var comment_time    = $("<p class=comment-time> #{message.created_at.strftime("%Y-%m-%d %H:%M:%S")}");
    var comment         = $("<p class=comment> #{message.body}");
    var html            = $('.content-center-ajax').append(member_nickname, comment_time, comment);
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
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
      var html = buildHTML(data);
      $('.right-content-center').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
