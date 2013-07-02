class University < ActiveRecord::Base
  include ParanoiaInterface

  ## Relations ##
  has_many :users

  ## Attributes ##
  attr_accessible :address,
                  :city,
                  :name,
                  :phone,
                  :web_address,
                  :zip_code

  ## Validations ##
  validate :name, presence: true
end
