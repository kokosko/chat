class SessionsController < ApplicationController
  def create
    if request.env['omniauth.auth']['extra']['raw_info']['hd']
      authenticate(request.env['omniauth.auth'])
      redirect_to chat_index_path
    else
      redirect_to root_path,
                  flash: { error: 'You need Log In with corporate account!' }
    end
  end

  def destroy
    current_user.offline!
    ActionCable.server.broadcast current_user.corp, user: current_user
    cookies[:user_id] = nil
  end

  private

  def authenticate(auth)
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
           User.create_with_omniauth(auth)
    user.online!
    cookies[:user_id] = user.id
    ActionCable.server.broadcast user.corp, user: user
  end
end
