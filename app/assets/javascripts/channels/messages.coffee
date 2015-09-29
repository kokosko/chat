App.messages = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    if data.user
      console.log(data.user.status)
      $("#user_#{data.user.id} .status").removeClass('online away offline').addClass(data.user.status)
    else
      message = $('<p />').attr({ 'class': 'message'}).append($('<span />').attr({ 'class': 'username' }).html("#{data.username}: ")).append($('<span />').attr({ 'class': 'text' }).text(data.message))
      $('#messages').append(message)
      $('.messages').scrollTop $('.messages')[0].scrollHeight
