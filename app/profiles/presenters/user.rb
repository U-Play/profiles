module Presenters
  class User < Profiles::Base
    extend Forwardable
    def_delegator :user, :save, :save!

    def initialize user
      @user = user
    end

    def full_name 
      @user.first_name + " " + @user.last_name
    end

    # active record

    def self.find(id)
      self.new User.find(id)
    end

    def self.build(hash)
      self.new User.new(hash)
    end

    def self.find_by(hash)
      self.new User.find_by(hash)
    end

    attr_reader :user
  end
end
