class Authorization < ActiveRecord::Base
  include ParanoiaInterface

  belongs_to :user

  attr_accessible :email,
                  :first_name,
                  :image_url,
                  :last_name,
                  :link,
                  :provider,
                  :name,
                  :token,
                  :uid


end
