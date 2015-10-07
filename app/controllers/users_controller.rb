class UsersController < ApplicationController
  def update
    current_user.update(status: params[:user][:status])
    ActionCable.server.broadcast current_user.corp, user: current_user
    render nothing: true
  end
end
