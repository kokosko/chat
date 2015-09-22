class ChatController < ApplicationController
  def index
    @users = User.online
    @messages = Message.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    ActionCable.server.broadcast 'chat', message: params[:message][:text],
                                         username: current_user.name
  end

  def message_params
    params.require(:message).permit!
  end
end
