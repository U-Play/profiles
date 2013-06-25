Given(/^I am a user$/) do
end

Given(/^there is an user$/) do
  @user = Presenters::User.new create(:user)
end

When(/^I go to the user's profile$/) do
  visit profile_path(@user.user.id)
end

Then(/^I should see his information|I should see all my information$/) do
  page.should have_content @user.full_name
end

Given(/^I am a signed user$/) do
  @user = Presenters::User.new create(:user)
  step "I go to the sign in page"
  step "I sign up via facebook"
end

When(/^I go to my profile$/) do
  visit my_profile_path
end
