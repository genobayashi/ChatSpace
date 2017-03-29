$(function() {
  var list = $("#user-list");
  var preWord;

  function appendList(word) {
    var item = $('<li class="list">').append(word);
    list.append(item);
  }

  function editElement(element) {
    var result = "%" + element + "%";
    return result;
  }

  $("#keyword").on("keyup", function() {
    var input = $("#keyword").val();
    var inputs = input.split(" ").filter(function(e) { return e; });
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    $.ajax({
      type: 'GET',
      url: '/groups/ajax_user_list',
      data: {
        user_nickname: word
      },
      dataType: 'json'
    })
    .done(function(data) {
      var users_info = (data.user_list.user);
      $(".list").remove();
      if(word != preWord && input.length !== 0){
        $.each(users_info, function(i, user){
          appendList(user.nickname);
        });
        if($(".list").length === 0){
          appendList("一致するメンバーはいません");
        }
      }
    })
    .fail(function(){
      alert('error');
    });
  });
});
