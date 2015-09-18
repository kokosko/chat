class ChatController < ApplicationController
  def index
  end

  def create

    ActionCable.server.broadcast 'chat',
                                 message: params[:chat][:text],
                                 username: cookies.signed[:username]
    head :ok
  end
end
