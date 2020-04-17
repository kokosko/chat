class Message < ActiveRecord::Base

  validates_presence_of :username, :text
  validates_length_of :text, minimum: 5

end
