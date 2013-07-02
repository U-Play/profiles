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
  step "I go to the sign in page"
  step "I sign up via facebook"
end

When(/^I go to my profile$/) do
  visit my_profile_path
end

Then(/^I should see all my information$/) do
  page.should have_content @athlete.full_name
end

