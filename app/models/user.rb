require 'open-uri'

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

  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :birth_date,
                  :bio,
                  :facebook_link,
                  :twitter_handle,
                  :password,
                  :password_confirmation,
                  :profile_finished,
                  :remember_me,
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

  has_attached_file :picture,
                    path: ':rails_root/public/system/:attachment/:id/:style/:filename',
                    url:  '/system/:attachment/:id/:style/:filename'
  attr_reader :picture_remote_url
end
