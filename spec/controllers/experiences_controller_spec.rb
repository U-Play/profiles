require 'spec_helper'

describe ExperiencesController do

  context "#create" do
    it "sanitizes empty tournaments" do
      sign_in create(:user)
      params = { experience: {
        tournaments_attributes: {tournament1: {"name" => nil, "achievements" => nil, "award_date(1i)" => nil} }
      } }

      post :create, params

      controller.params['experience']['tournament_attributes'].should be_blank
    end
  end
end
