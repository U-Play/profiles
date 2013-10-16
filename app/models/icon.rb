class Icon < ActiveRecord::Base
  attr_accessible :name
  has_many :tournaments

  validates :name, uniqueness: true
end
