class Achievement < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :sport_experience

  ## Attributes ##
  attr_accessible :achievement, 
                  :award_date, 
                  :tournament,
                  :sport_experience,
                  :sport_experience_id

  has_attached_file :icon,
                    path: ':rails_root/public/system/achievements/:id/:style/:filename',
                    url:  '/system/achievements/:id/:style/:filename'

  attr_reader :icon_remote_url
                  

  ## Validations ##
  validates :tournament, 
            :achievement, 
            :sport_experience_id, 
            :award_date, 
            presence: true
end
