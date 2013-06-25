Given(/^I am a user$/) do
end

Given(/^there is an athlete$/) do
  @athlete = create :user
end

When(/^I go to the athlete's profile$/) do
  visit profile_path @athlete.id
end

Then(/^I should see his information$/) do
  page.should have_content athlete.name
end

Given(/^I am a signed user$/) do
  #controller.stub(:current_user).and_return(user)
end

When(/^I go to my profile$/) do
end

Then(/^I should see all my information$/) do
  #page.should have_content athlete.name
end

