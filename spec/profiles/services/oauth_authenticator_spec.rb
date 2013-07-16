require 'spec_helper'

describe Services::OauthAuthenticator do

  context "#authenticate!" do
    it "authenticates an existing facebook user" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      user = create :user
      authorization = create :facebook_authorization, uid: facebook_data[:uid], user: user
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.should eq user
    end

    it "authenticates an existing user without the given authorization" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      user = create :user, email: OmniAuth.config.mock_auth[:facebook].info.email
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.should eq user
    end

    it "creates a new user when it doesn't exist" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.should be_valid
    end

    it "sets the correct user birth_date" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.birth_date.should eq DateTime.strptime('30/01/1990', '%d/%m/%Y')
    end

    it "doesn't fail if an optional OAuth hash is missing" do
      facebook_data = OmniAuth.config.mock_auth[:facebook_limited]
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!
    end
  end
end
