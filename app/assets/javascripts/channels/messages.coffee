App.messages = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    if data.user
      if data.user.status == 'online'
        user = $('<div />').attr({ 'class': 'user', 'id': "user_#{data.user.id}" })
        user.append($('<img />').attr({ 'src': "#{data.user.image}" }))
        user.append($('<p />').text(data.user.name))
        $('#users').append(user)
      else
        $("#user_#{data.user.id}").remove()
    else
      message = $('<p />').attr({ 'class': 'message'}).append($('<span />').attr({ 'class': 'username' }).html("#{data.username}: ")).append($('<span />').attr({ 'class': 'text' }).text(data.message))
      $('#messages').append(message)
      $('.messages').scrollTop $('.messages')[0].scrollHeight
