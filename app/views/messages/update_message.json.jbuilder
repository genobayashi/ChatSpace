json.update_message  @messages do |message|
  json.body       message.body
  json.nickname   message.user.nickname
  json.created_at message.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.image      message.image
end
