require 'spec_helper'

describe Users::OmniauthCallbacksController do
  context "#facebook" do
    context "new users are enabled" do
      it 'creates an active user' do
        setup_facebook_request
        Settings.stub(:auto_activate_users).and_return(true)

        get :facebook

        response.should redirect_to edit_my_profile_path
      end
    end

    context "new users are disabled" do
      it 'creates an active user' do
        setup_facebook_request
        Settings.stub(:auto_activate_users).and_return(false)

        get :facebook

        response.should redirect_to wip_path(assigns[:user])
      end
    end
  end
end

def setup_facebook_request
  request.env["devise.mapping"] = Devise.mappings[:user]
  request.env["omniauth.auth"]  = OmniAuth.config.mock_auth[:facebook]
end
