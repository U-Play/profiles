def facebook_user
  user = User.where(email: OmniAuth.config.mock_auth[:facebook].info.email).first
  UserPresenter.new(user, self)
end

Given(/^I am a user$/) do
end

Given(/^there is a user$/) do
  @user = UserPresenter.new(create(:user), self)
end

When(/^I go to the user's profile$/) do
  visit profile_path(@user.id)
end

Then(/^I should see his information|I should see all my information$/) do
  page.should have_content @user.full_name
end

Given(/^I am a signed user$/) do
  step "I go to the sign in page"
  step "I sign up via facebook"
  @user = facebook_user
end

When(/^I go to my profile$/) do
  visit my_profile_path
end

Then(/^I should see my facebook name$/) do
  page.should have_content facebook_user.full_name
end
