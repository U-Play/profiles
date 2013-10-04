class Tournament < ActiveRecord::Base
  include ParanoiaInterface

  default_scope order: :award_date

  ## Relations ##
  belongs_to :experience
  belongs_to :icon

  ## Attributes ##
  attr_accessible :achievements,
                  :award_date,
                  :icon,
                  :icon_id,
                  :name,
                  :experience,
                  :experience_id


  ## Validations ##
  validates :name,
            presence: true

end
