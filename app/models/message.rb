class Message < ActiveRecord::Base
  validates :text, :username, :city, presence: true
end
