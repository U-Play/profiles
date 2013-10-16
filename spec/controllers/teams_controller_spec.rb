require 'spec_helper'

describe TeamsController do

  context "#create" do
    it "sanitizes empty tournaments" do
      sign_in create(:user)
      params = { team: {
        tournaments_attributes: {tournament1: {"name" => nil, "achievements" => nil, "award_year" => nil} }
      } }

      post :create, params

      controller.params['team']['tournament_attributes'].should be_blank
    end

    it "checks for nil tournament_attributes" do
      sign_in create(:user)
      params = { team: {} }

      expect {
        post :create, params
      }.to_not raise_error
    end
  end
end
