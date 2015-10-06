App.messages = App.cable.subscriptions.create 'ChatChannel',
  received: (data) ->
    if data.message
      $('#messages').append(data.message)
      $('body').scrollTop $('body')[0].scrollHeight
    else
      if $("#user_#{data.user.id}").length > 0
        $("#user_#{data.user.id} .status").removeClass('online away offline').addClass(data.user.status)
      else
        $('#users').append($('<div />').attr({ 'class': 'user', 'id': "user_#{data.user.id}"}).append($('<div />').attr({'class': 'avatar'}).append($('<img />').attr({ 'src': "#{data.user.image}" })).append($('<div />').attr({ 'class': "status #{data.user.status}"}))).append($('<span />').text(data.user.name)))

$(document).ready ->
  setTimeout ( ->
    $('#messages').scrollTop $('#messages')[0].scrollHeight
  ), 500
