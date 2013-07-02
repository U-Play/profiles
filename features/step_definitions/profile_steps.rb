Given(/^I am a user$/) do
end

Given(/^there is an athlete$/) do
  @athlete = Presenters::User.new create(:user)
end

When(/^I go to the athlete's profile$/) do
  visit profile_path(@athlete.user.id)
end

Then(/^I should see his information$/) do
  page.should have_content @athlete.full_name
end

Given(/^I am a signed user$/) do
  @athlete = Presenters::User.new create(:user)
  visit new_user_session_path
  fill_in 'Email', with: @athlete.user.email
  fill_in 'Password', with: @athlete.user.password
  click_button 'Sign in'
end

When(/^I go to my profile$/) do
  visit my_profile_path
end

Then(/^I should see all my information$/) do
  page.should have_content @athlete.full_name
end

