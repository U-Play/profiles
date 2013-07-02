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
  #controller.stub(:current_user).and_return(user)
end

When(/^I go to my profile$/) do
end

Then(/^I should see all my information$/) do
  #page.should have_content athlete.name
end

