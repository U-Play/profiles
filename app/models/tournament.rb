class Tournament < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :sport_experience

  ## Attributes ##
  attr_accessible :achievements,
                  :award_date,
                  :icon,
                  :name,
                  :sport_experience,
                  :sport_experience_id


  ## Validations ##
  validates :name,
            :achievements,
            :award_date,
            presence: true
end
