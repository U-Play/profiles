require 'spec_helper'

describe Users::OmniauthCallbacksController do
  context "#facebook" do
    it 'returns a new user' do
      setup_facebook_request
      user = build :user
      Profiles::OauthAuthenticator.any_instance.stub(:authenticate!).and_return(user)
      user.stub(:persisted?).and_return(true)
      user.stub(:save).and_return(true)

      controller.should_receive(:sign_in_and_redirect).with(user, event: :authentication).and_call_original

      get :facebook
    end
  end
end

def setup_facebook_request
  request.env["devise.mapping"] = Devise.mappings[:user]
  request.env["omniauth.auth"]  = OmniAuth.config.mock_auth[:facebook]
end
