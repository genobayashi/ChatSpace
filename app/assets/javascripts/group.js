$(function() {
  var list = $("#user-list");
  var noMember = $('<p class="no-member"> 一致するメンバーはいません </p>')
  var preWord;

  function appendList(user) {
    var item = $(`<li class="list" data-user_nickname=${user.nickname} data-user_id=${user.id}>
                  ${user.nickname}
                  <a class="add-user"> 追加 </a>
                  </li>`);
    list.append(item);
  }

  function addUserResult(nickname, userId) {
    var member = $(`<li class="chat-group-user">
                      <input name="group[user_ids][]" type="hidden" value=${userId}>
                      ${nickname}
                      <a class="remove-user"> 削除 </a>
                    </li>`);
    $('.field-input').append(member);
  }

  $("#keyword").on("keyup", function() {
    var input = $("#keyword").val();
    $.ajax({
      type: 'GET',
      url: '/groups/ajax_user_list',
      data: {
        user_nickname: input
      },
      dataType: 'json'
    })
    .done(function(data) {
      var usersInfo = data.user_list.user;
      if ( input != preWord ) {
        $('.list').remove();
        if(input.length !== 0) {
          $.each(usersInfo, function(i, user){
            appendList(user);
          });
          if($(".list").length === 0){
            list.append(noMember);
          }
        }
      }
    })
    .fail(function(){
      alert('error');
    });
  });

  $("#user-list").on('click','.add-user', function(){
    $(this).parent().remove();
    var nickname = $(this).parent().data('user_nickname');
    var userId = $(this).parent().data('user_id');
    addUserResult(nickname, userId);
  });

  $(".field-input").on('click', '.remove-user', function(){
    $(this).parent().remove();
  });
});
