module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      redirect_to '/' && return unless cookies[:user_id]
      current_user = User.find(cookies[:user_id])
      current_user
    end
  end
end
