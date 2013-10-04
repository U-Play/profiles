class Experience < ActiveRecord::Base
  include ParanoiaInterface

  default_scope order: 'ongoing, end_date DESC, start_date DESC'

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
                  :team,
                  :sport_role,
                  :sport_role_id,
                  :sport,
                  :sport_id,
                  :user,
                  :user_id,
                  :tournaments_attributes

  ## Validations ##
  validates :sport_id,
            :sport_role_id,
            :user_id,
            :team,
            :start_date,
            presence: true

  validate :end_date_or_ongoing
  validate :start_date_before_end_date

  ## Callbacks ##
  before_validation :set_ongoing

  private

  def end_date_or_ongoing
    if end_date.nil? and not ongoing
      errors.add(:end_date, :blank)
    end
  end

  def start_date_before_end_date
    if start_date.present? and !ongoing and end_date.present? and end_date < start_date
      errors.add(:end_date, I18n.t('experience.form.errors.date_before', date: 'Start date'))
    end
  end

  def set_ongoing
    self.ongoing = end_date.nil? ? true : false
    return true
  end
end
