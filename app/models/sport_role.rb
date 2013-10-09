class SportRole < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  has_many :teams

  ## Attributes ##
  attr_accessible :description,
                  :name

  ## Validations ##
  validates :name, presence: true
  validates :name, uniqueness_without_deleted: true
end
