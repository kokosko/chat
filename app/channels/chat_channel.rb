class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user.corp
  end
end
