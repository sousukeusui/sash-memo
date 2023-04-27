class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line google_oauth2]

  validates :name, presence: true, length:{ maximum: 15}

  has_many :sites
  has_many :contractors

  def self.from_omniauth(omniauth:)
    self.find_or_create_by(provider: omniauth.provider, uid: omniauth.uid) do |user|
      user.password = SecureRandom.base64
      if omniauth.info.email.blank?
        user.email = "#{omniauth.provider}-#{omniauth.uid}@example.com"
      else
        user.email = omniauth.info.email
      end
      user.name = omniauth.info.name
    end
  end
end
