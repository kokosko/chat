class UsersController < ApplicationController
  def update
    current_user.update(status: user_params[:status])
    ActionCable.server.broadcast 'chat', user: current_user
    render nothing: true
  end

  def user_params
    params.require(:user).permit!
  end
end
