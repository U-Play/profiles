When(/^I am at my profile's edit page$/) do
  @user = UserPresenter.new(User.last, self)
  visit edit_my_profile_path
end

When(/^I edit my information$/) do
  fill_in :user_email, with: 'yo@gmail.com'
  click_on 'Submit'
end

When(/^I leave a required field blank$/) do
  fill_in :user_email, with: nil
  click_on 'Submit'
end

Then(/^I should see a success message$/) do
  page.should have_content 'successfully'
end

Then(/^I should see a failure message$/) do
  page.should have_content 'prohibited'
end
