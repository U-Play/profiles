class User < ActiveRecord::Base

  devise  :database_authenticatable,
          :omniauthable,
          :trackable,
          :validatable

  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :password,
                  :profile_finished,
                  :remember_me

  has_many :authorizations
end
