class Tournament < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :sport_experience
  belongs_to :icon

  ## Attributes ##
  attr_accessible :achievements,
                  :award_date,
                  :icon,
                  :icon_id,
                  :name,
                  :sport_experience,
                  :sport_experience_id


  ## Validations ##
  validates :name,
            :award_date,
            presence: true
end
