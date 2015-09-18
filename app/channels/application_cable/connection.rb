module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :current_user

    # def connect
    #   self.current_user = set_verified_user
    # end

    # protected
    #   def set_verified_user
    #     if current_user = User.find(session[:user_id])
    #       current_user
    #     else
    #       reject_unauthorized_connection
    #     end
    #   end
  end
end
