class ChatController < ApplicationController
  def index
    redirect_to(root_path) && return unless current_user
    current_user.online!
    @users = User.order(:status)
    @messages = Message.all.includes(:user).page(params[:page])
                .order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    return unless @message.save
    message = render partial: 'chat/message', locals: { message: @message }
    ActionCable.server.broadcast 'chat', message: message
  end

  def message_params
    params.require(:message).permit!
  end
end
