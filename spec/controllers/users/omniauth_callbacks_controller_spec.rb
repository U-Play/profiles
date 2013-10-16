require 'spec_helper'

describe Users::OmniauthCallbacksController do
  context "#facebook" do
    it 'registers a user' do
      setup_facebook_request

      get :facebook

      response.should redirect_to edit_my_profile_path
    end
  end
end

def setup_facebook_request
  request.env["devise.mapping"] = Devise.mappings[:user]
  request.env["omniauth.auth"]  = OmniAuth.config.mock_auth[:facebook]
end
