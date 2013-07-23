class Achievement < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :sport_experience

  ## Attributes ##
  attr_accessible :achievement,
                  :award_date,
                  :icon,
                  :tournament,
                  :sport_experience,
                  :sport_experience_id
                  

  ## Validations ##
  validates :tournament,
            :achievement,
            :award_date,
            presence: true
end
