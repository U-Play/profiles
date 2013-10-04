require 'spec_helper'

describe Services::GenerateUsername do

  context "#generate" do
    it "generates a valid username" do
      user = build :user

      generate_username = Services::GenerateUsername.new(user)

      generate_username.generate.should be_present
    end

    it "cleans an existing username" do
      user = build :user_with_dirty_username
      username = user.username
      username.delete!(' ')
      username = username.mb_chars.normalize(:kd).gsub(/[^[:ascii:]]/n,'').to_s

      generate_username = Services::GenerateUsername.new(user)

      generate_username.generate.should eq username
    end

    it "removes whitespaces" do
      user = build :user_with_dirty_username

      generate_username = Services::GenerateUsername.new(user)

      generate_username.generate.match(/\s/).should be_nil
    end

    it "removes accents" do
      user = build :user_with_dirty_username

      generate_username = Services::GenerateUsername.new(user)

      generate_username.generate.match(/[^[:ascii:]]/).should be_nil
    end
  end
end
