require 'spec_helper'

describe Services::GenerateUsername do

  it 'generates a username' do
    user = build(:user, first_name: 'first', last_name: 'last')
    generate_username = Services::GenerateUsername.new(user: user)

    generate_username.generate.should_not be_blank
  end

  it 'returns a valid username when the first name is missing' do
    user = build(:user, first_name: nil, last_name: 'last')
    generate_username = Services::GenerateUsername.new(user: user)

    generate_username.generate.should_not be_blank
  end

  it "doesn't fail when the user is nil" do
    generate_username = Services::GenerateUsername.new(user: nil)

    lambda { generate_username.generate }.should_not raise_error(NoMethodError)
  end

end
