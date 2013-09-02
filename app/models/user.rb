require 'open-uri'

class User < ActiveRecord::Base
  include ParanoiaInterface

  has_many :authorizations
  has_many :experiences, :dependent => :destroy, :inverse_of => :user

  devise  :database_authenticatable,
          :omniauthable,
          :trackable,
          :validatable

  attr_accessible :active,
                  :email,
                  :first_name,
                  :last_name,
                  :birth_date,
                  :quote,
                  :facebook_link,
                  :twitter_handle,
                  :password,
                  :password_confirmation,
                  :picture,
                  :profile_finished,
                  :remember_me,
                  :country,
                  :university,
                  :token,
                  :referral_views,
                  :referral_subscriptions

  ## Validations ##
  before_validation :generate_token

  validates :email,
            :first_name,
            :last_name,
            :birth_date,
            :token,
            :referral_views,
            :referral_subscriptions,
            presence: true

  validates :email, uniqueness_without_deleted: true
  validates :token, uniqueness: true

  has_attached_file :picture,
                    styles: { sidebar: '200x200#' },
                    default_url: '/assets/default-profile-picture.png'

  attr_reader :picture_remote_url

  def sports
    Sport.joins(:experiences).where(experiences: {user_id: id})
  end

  private

  def generate_token
     self.token = SecureRandom.uuid
  end

end
