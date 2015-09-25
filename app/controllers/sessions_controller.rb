class SessionsController < ApplicationController
  def create
    authenticate(request.env['omniauth.auth'])
    redirect_to chat_index_path, notice: 'Signed in!'
  end

  def destroy
    current_user.offline!
    ActionCable.server.broadcast 'chat', user: current_user
    session[:user_id] = nil
  end

  private

  def authenticate(auth)
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
           User.create_with_omniauth(auth)
    user.online!
    session[:user_id] = user.id
    ActionCable.server.broadcast 'chat', user: user
  end
end
