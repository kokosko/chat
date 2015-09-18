App.messages = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    $('#messages').append("<p><span class='username'>[#{data.username}]: </span><span class='text'>#{data.message}</span></p>")
