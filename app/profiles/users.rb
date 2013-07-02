module Profiles
  module Users
    def self.find id
      user = User.find id
      Presenters::User.new user
    end
  end
end
