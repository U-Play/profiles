class User < ActiveRecord::Base

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :invitable

  attr_accessible :email,
                  :name,
                  :password,
                  :password_confirmation,
                  :remember_me
end
