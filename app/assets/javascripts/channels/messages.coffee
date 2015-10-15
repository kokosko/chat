$(document).ready ->
  if window.location.pathname == '/chat'
    subscribe_to_channel()
    mark_last_avatar()
    notify()

$(document).ready ->
  setTimeout ( ->
    $('#messages').scrollTop $('#messages')[0].scrollHeight
  ), 500

notify = ->
  if Notification.permission == 'default'
    Notification.requestPermission()

notification = undefined
permission =  true if Notification.permission == 'granted'

show_notification = (message, user) ->
  notification = new Notification(user.name, { body: message.text, icon: user.image})
  notification.onshow = ->
    setTimeout (->
      notification.close()
      return
    ), 3000


mark_last_avatar = ->
  $('.message .avatar img').last().addClass('last')

subscribe_to_channel = ->
  App.messages = App.cable.subscriptions.create 'ChatChannel',
    received: (data) ->
      if data.message
        show_notification(data.message, data.user) if permission && document.hidden
        add_message(data.message, data.user.image)
        $('body').scrollTop $('body')[0].scrollHeight
      else
        if $("#user_#{data.user.id}").length > 0
          $("#user_#{data.user.id} .status").removeClass('online away offline').addClass(data.user.status)
        else
          $('#users').append($('<div />').attr({ 'class': 'user', 'id': "user_#{data.user.id}"}).append($('<div />').attr({'class': 'avatar'}).append($('<img />').attr({ 'src': "#{data.user.image}" })).append($('<div />').attr({ 'class': "status #{data.user.status}"}))).append($('<span />').text(data.user.name)))

add_message = (message, image) ->
  if $('.last').length > 0
    last_image = $('.last')[0].src
  else
    last_image = ''
  if last_image != image
    $('.last').last().removeClass('last')
    $('#messages').append($('<div />').attr({ 'class': 'message'}).append($('<div />').attr({ 'class': 'avatar'}).append($('<img />').attr({ 'src': image, 'class': 'last'}))).append($('<div />').attr({ 'class': 'text'}).text(message.text)))
  else
    $('#messages').append($('<div />').attr({ 'class': 'message'}).append($('<div />').attr({ 'class': 'avatar'})).append($('<div />').attr({ 'class': 'text'}).text(message.text)))

