class User < ActiveRecord::Base
  has_many :messages, dependent: :destroy

  enum status: [:online, :offline, :away]

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.image = auth['info']['image']
      user.email = auth['info']['email']
      user.corp = auth['info']['email'].split('@')[1]
    end
  end

  scope :corp, -> (corp) { where('corp = ?', corp) }
end
