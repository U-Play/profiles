class SportExperience < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  belongs_to :sport_role
  belongs_to :sport
  belongs_to :user

  has_many :achievements

  ## Attributes ##
  attr_accessible :end_date, 
                  :position, 
                  :start_date, 
                  :team, 
                  :university,
                  :sport_role,
                  :sport_role_id,
                  :sport,
                  :sport_id,
                  :user,
                  :user_id

  ## Validations ##
  validates :sport_id, 
            :sport_role_id, 
            :user_id, 
            :team, 
            :start_date, 
            presence: true
end