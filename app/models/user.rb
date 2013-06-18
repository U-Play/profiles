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
end
