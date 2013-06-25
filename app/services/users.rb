module Profiles
  module Users
    def self.find id
      user = User.find if
      Presenters::User.new user
  end
end
