class ChatController < ApplicationController
  def index
    redirect_to(root_path) unless current_user
    @users = User.order(:status)
    @messages = Message.all.includes(:user).page(params[:page])
                .per(20).order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    return unless @message.save
    ActionCable.server.broadcast 'chat', message: params[:message][:text],
                                         username: current_user.name
  end

  def message_params
    params.require(:message).permit!
  end
end
