require 'spec_helper'

describe Services::OauthAuthenticator do

  context "#authenticate!" do
    it "authenticates an existing facebook user" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      user = build :user
      authorization = build :facebook_authorization, uid: facebook_data[:uid], user: user
      authenticator = Services::OauthAuthenticator.new(facebook_data)
      Authorization.stub(:where).and_return([authorization])

      authenticator.authenticate!

      authenticator.user.should eq user
    end

    it "authenticates an existing user without the given authorization" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      user = create :user, email: 'dummy@dummy.com'
      User.stub(:find_by_email).and_return(user)
      user.authorizations.stub(:create)
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.should eq user
    end

    it "creates a new user when it doesn't exist" do
      facebook_data = OmniAuth.config.mock_auth[:facebook]
      User.any_instance.stub(:save)
      User.any_instance.stub_chain(:authorizations, :create)
      authenticator = Services::OauthAuthenticator.new(facebook_data)

      authenticator.authenticate!

      authenticator.user.should be_valid
    end
  end
end
