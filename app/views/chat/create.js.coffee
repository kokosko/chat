$('#message_text').val('')
$('#messages').prepend('<%= render partial: "chat/message", object: @message %>')

