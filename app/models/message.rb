class Message < ActiveRecord::Base
  validates :text, :user_id, presence: true
  belongs_to :user

  paginates_per 20

  scope :for_corp, -> (corp) { where('corp = ?', corp) }
end
