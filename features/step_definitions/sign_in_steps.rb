Given(/^I am a visitor$/) do
end

Given(/^I am a signed user$/) do
  step "I go to the sign in page"
  step "I sign up via facebook"
  @user = facebook_user
end

Given(/^I am a registered user$/) do
  @user = UserPresenter.new(create(:user), self)
end

When(/^I go to the sign in page$/) do
  visit new_user_session_path
end

When(/^I sign up via facebook$/) do
  click_on 'Sign in with Facebook'
end

When(/^I sign out$/) do
  visit destroy_user_session_path
end

Then(/^I should see that I am signed up from facebook$/) do
  page.should have_content 'Welcome'
end

Then(/^I should be redirected to my profile edit page$/) do
  current_path.should eq edit_my_profile_path
end

Then(/^I should be redirected to my profile page$/) do
  current_path.should eq my_profile_path
end

