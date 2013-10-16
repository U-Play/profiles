require 'open-uri'

class User < ActiveRecord::Base
  include ParanoiaInterface

  has_many :authorizations
  has_many :teams, :dependent => :destroy, :inverse_of => :user

  devise  :database_authenticatable,
          :omniauthable,
          :trackable,
          :validatable

  attr_accessible :email,
                  :username,
                  :first_name,
                  :last_name,
                  :birth_date,
                  :facebook_link,
                  :twitter_handle,
                  :password,
                  :password_confirmation,
                  :picture,
                  :profile_complete,
                  :remember_me,
                  :country,
                  :university,
                  :gender,
                  :token,
                  :referral_views,
                  :referral_subscriptions

  ## Validations ##
  before_validation :generate_token

  validates :university, :country, :gender, presence: true, on: :update, if: :profile_complete
  validates_with Validators::CountryValidator, on: :update, if: :profile_complete

  validates :email,
            :first_name,
            :last_name,
            :birth_date,
            :token,
            :referral_views,
            :referral_subscriptions,
            presence: true
  validates :gender, inclusion: {in: %w(male female)}
  validates :email, uniqueness_without_deleted: true
  validates :token, uniqueness: true
  validates :username, exclusion: {in: %w(me user)}, uniqueness: {case_sensitive: false}, allow_blank: true

  validate :username_is_valid
  validate :facebook_link_is_unchanged

  has_attached_file :picture,
                    styles: { sidebar: '200x200#' },
                    default_url: '/assets/default-profile-picture.png'

  attr_reader :picture_remote_url

  def sports
    teams.map(&:sport)
  end

  def self.find_by_username(username)
    where("lower(username) = ?", username.downcase).first
  end

  private

  def generate_token
     self.token = SecureRandom.uuid
  end

  def username_is_valid
    # is valid if it doesn't contain whitespaces and accents
    if username.match(/[^[:ascii:]]|\s/)
      errors.add(:username, I18n.t('user.edit.errors.username'))
    end
  end

  def facebook_link_is_unchanged
    original_link = authorizations.first.try :link
    if original_link.present? && facebook_link != original_link
      errors.add(:facebook_link,I18n.t('user.edit.errors.facebook_link'))
      self.facebook_link = original_link
    end
  end
end
