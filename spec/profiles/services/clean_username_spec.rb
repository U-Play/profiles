require 'spec_helper'

describe Services::CleanUsername do

  context "#clean" do
   it "removes whitespaces" do
      user = build :user_with_dirty_username

      clean_username = Services::CleanUsername.new(username: user.username)

      clean_username.clean.match(/\s/).should be_nil
    end

    it "removes accents" do
      user = build :user_with_dirty_username

      clean_username = Services::CleanUsername.new(username: user.username)

      clean_username.clean.match(/[^[:ascii:]]/).should be_nil
    end
  end

end
