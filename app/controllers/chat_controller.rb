class ChatController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    @messages = Message.order(created_at: :desc)
  end

  def show
    @message.update_attribute(:approved, true)
  end

  def update
    @message.update_attribute(:approved, false)
  end

  def create
    @message = Message.new(message_params)
    return unless @message.save
#    ActionCable.server.broadcast @message, message: @message
  end

  def destroy
    @message.destroy
  end

  def message_params
    params.require(:message).permit!
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
