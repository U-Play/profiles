require 'spec_helper'

describe ApplicationController do

  context "#user_path" do
    it "returns username_path if the username is defined" do
      user = create(:user_with_username)
      sign_in user
      controller.user_path(user).should eq username_path(user.username)
    end

    it "returns username_path if the username isn't defined" do
      user = create(:user)
      sign_in user
      controller.user_path(user).should eq profile_path(user.id)
    end
  end
end
