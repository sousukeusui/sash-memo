class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def self.from_omniauth(omniauth:)
    self.find_or_create_by(provider: omniauth.provider, uid: omniauth.uid) do |user|
      user.password = SecureRandom.base64
      if omniauth.email.blank?
        user.email = "#{omniauth.provider}-#{omniauth.uid}@example.com"
      else
        user.email = omniauth.email
      end
      user.name = omniauth.info.name
      user.is_valid = true
    end
  end
end
