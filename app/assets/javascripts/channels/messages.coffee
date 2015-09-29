App.messages = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    if data.user
      if $("#user_#{data.user.id}").length > 0
        $("#user_#{data.user.id} .status").removeClass('online away offline').addClass(data.user.status)
      else
        $('#users').append($('<div />').attr({ 'class': 'user', 'id': "user_#{data.user.id}"}).append($('<div />').attr({'class': 'image'}).append($('<img />').attr({ 'src': "#{data.user.image}" })).append($('<div />').attr({ 'class': "status #{data.user.status}"}))).append($('<span />').text(data.user.name)))
    else
      message = $('<p />').attr({ 'class': 'message'}).append($('<span />').attr({ 'class': 'username' }).html("#{data.username}: ")).append($('<span />').attr({ 'class': 'text' }).text(data.message))
      $('#messages').append(message)
      $('.messages').scrollTop $('.messages')[0].scrollHeight
