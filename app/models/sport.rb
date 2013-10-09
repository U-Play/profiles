class Sport < ActiveRecord::Base
  include ParanoiaInterface

  default_scope order: :name

  ## Relations ##
  has_many :teams

  ## Attributes ##
  attr_accessible :description,
                  :name

  ## Validations ##
  validates :name, presence: true
  validates :name, uniqueness_without_deleted: true
end
