class UsersController < ApplicationController
  def update
    current_user.update(status: params[:user][:status])
    ActionCable.server.broadcast 'chat', user: current_user
    render nothing: true
  end
end
