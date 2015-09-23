$('#messages').prepend("<%= j(render partial: 'chat/message', collection: @messages.sort_by(&:id)) %>")
$('.showmore').html("<%= j(render partial: 'chat/show_more', locals: { page: params[:page].to_i + 1 }) unless @messages.last_page? %>")
