$(function() {

  function imageSrc(message){
    if(message.image.url == null){
      return "";
    } else {
      var image_src= message.image.url
      return image_src;
    }
  }

  function buildHTML(message){
    var html = (`<div class="content-center-ajax">
                  <p class=right-content-center__members-nickname>${ message.nickname }</p>
                  <p class=right-content-center__comment-time>${ message.created_at }</p>
                  <p class=right-content-center__comment>${ message.body }</p>
                  <image src= ${ imageSrc(message) }>
                </div>`);
    return html;
  }

  $('.right-content-bottom').on('submit', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var textField = $('#text_field');
    var form = $('.js-form').get()[0];
    var formData = new FormData(form);
    var path_name = location.pathname;
    $.ajax({
      type: 'POST',
      url: path_name,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
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

  $('#file_field').change(function() {
    $('#file_field').submit();
    $('#file_field').val('');
  });

  var setIV = setInterval(function(){
    var path_name = location.pathname;
    if ( path_name.match( /messages/ )) {
      $.ajax({
        type: 'GET',
        url: path_name,
        dataType: 'json',
      })
      .done(function(data) {
        $('.right-content-center').empty();
        $.each( data.update_message, function( i, message ) {
          var html = buildHTML(message);
          $('.right-content-center').append(html);
        });
      })
      .fail(function() {
        alert('error');
      });
    } else {
      clearInterval(setIV);
    }
  }, 5000);
});
