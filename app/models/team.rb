class Team < ActiveRecord::Base
  include ParanoiaInterface

  default_scope order: 'ongoing DESC, end_date DESC, start_date DESC'

  ## Relations ##
  belongs_to :sport_role
  belongs_to :sport
  belongs_to :user

  has_many :tournaments, :dependent => :destroy

  accepts_nested_attributes_for :tournaments, :allow_destroy => true

  ## Attributes ##
  attr_accessible :end_date,
                  :ongoing,
                  :position,
                  :start_date,
                  :name,
                  :sport_role,
                  :sport_role_id,
                  :sport,
                  :sport_id,
                  :user,
                  :user_id,
                  :tournaments_attributes

  ## Validations ##
  validates :name,
            :sport_id,
            :start_date,
            :sport_role_id,
            :user_id,
            presence: true

  validate :end_date_or_ongoing
  validate :start_date_before_end_date

  ## Callbacks ##
  before_validation :set_end_date

  private

  def end_date_or_ongoing
    if end_date.nil? and not ongoing
      errors.add(:end_date, :blank)
    end
  end

  def start_date_before_end_date
    if start_date.present? and !ongoing and end_date.present? and end_date < start_date
      errors.add(:end_date, I18n.t('team.form.errors.date_before', date: 'Start date'))
    end
  end

  def set_end_date
    self.end_date = nil if ongoing
    return true
  end
end
