class ChatController < ApplicationController
  def index
    redirect_to(root_path) && return unless current_user
    current_user.online!
    @users = User.corp(current_user.corp)
    @messages = Message.joins(:user).where('corp = ?', current_user.corp)
                .page(params[:page]).order(created_at: :desc)
  end

  def create
    @message = Message.new(message_params)
    return unless @message.save
    ActionCable.server.broadcast @message.user.corp, message: @message,
                                                     image: @message.user.image
  end

  def message_params
    params.require(:message).permit!
  end
end
