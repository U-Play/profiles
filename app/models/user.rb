class User < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :country
  belongs_to :university

  has_many :authorizations

  devise  :database_authenticatable,
          :omniauthable,
          :trackable,
          :validatable


  ## Attributes ##
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :birth_date,
                  :bio,
                  :facebook_link,
                  :twitter_handle,
                  :password,
                  :profile_finished,
                  :remember_me,
                  :password_confirmation,
                  :country,
                  :country_id,
                  :university,
                  :university_id


  ## Validations ##
  validate  :email,
            :first_name,
            :last_name,
            :birth_date,
            presence: true
end
