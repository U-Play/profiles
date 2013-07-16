def facebook_user
  user = User.where(email: OmniAuth.config.mock_auth[:facebook].info.email).first
  UserPresenter.new(user, self)
end

def user_edit_changes
  changes = Hash.new
  changes["user_first_name"] = "New Name"
  changes["user_bio"] ="New Bio"
  changes
end

Given(/^there is a user$/) do
  @user = UserPresenter.new(create(:user), self)
end

When(/^I go to the user's profile$/) do
  visit profile_path(@user.id)
end

Then(/^I should see his information|I should see all my information$/) do
  page.should have_content @user.full_name
  page.should have_content @user.bio
end

When(/^I go to my profile$/) do
  visit my_profile_path
end

Then(/^I should see my facebook name$/) do
  page.should have_content facebook_user.full_name
end


Given(/^I am at my profile's edit page$/) do
  visit edit_my_profile_path
end

When(/^I update my information$/) do
  @changes = user_edit_changes
  @changes.each { |field, value| fill_in field, with: value }
  click_on 'Submit'
end

Then(/^I should see my updated information$/) do
  @changes.values.each { |value| page.should have_content value }
end

Then(/^I should see a success message$/) do
  page.should have_content 'edited successfully'
end

When(/^I leave a required field blank$/) do
  fill_in 'user_first_name', with: ''
  click_on 'Submit'
end

Then(/^I should see a failure message$/) do
  page.should have_content "can't be blank"
end
