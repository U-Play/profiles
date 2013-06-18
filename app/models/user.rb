class User < ActiveRecord::Base

  devise  :confirmable,
          :database_authenticatable,
          :invitable,
          :omniauthable,
          :recoverable,
          :registerable,
          :rememberable,
          :trackable,
          :validatable

  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :password,
                  :password_confirmation,
                  :remember_me

  has_many :authorizations

  def self.find_or_create_for_oauth(info)
    user = where email: info[:email]
    create_user_for_oauth(info) if user.nil?
    ensure_user_has_provider
  end
end
