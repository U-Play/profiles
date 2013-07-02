class Country < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  has_many :users

  ## Attributes ##
  attr_accessible :abbrv_iso,
                  :name

  ## Validations ##
  validate :name, presence: true
end
