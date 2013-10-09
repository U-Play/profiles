class Tournament < ActiveRecord::Base
  include ParanoiaInterface

  default_scope order: 'award_year DESC, award_month DESC'

  ## Relations ##
  belongs_to :team
  belongs_to :icon

  ## Attributes ##
  attr_accessible :achievements,
                  :award_date,
                  :icon,
                  :icon_id,
                  :name,
                  :team,
                  :team_id,
                  :award_year,
                  :award_month


  ## Validations ##
  validates :name,
            :award_year,
            presence: true
end
