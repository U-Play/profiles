Given(/^I am a visitor$/) do
end

Given(/^I am a signed user$/) do
  step "I go to the root page"
  step "I sign up via facebook"
  @user = Presenters::UserPresenter.new(facebook_user, self)
end

Given(/^I am a signed user with username$/) do
  step "I go to the root page"
  step "I sign up via facebook"
  @user = Presenters::UserPresenter.new(facebook_user_with_username, self)
end

Given(/^I am a signed user and my profile is complete$/) do
  step "I go to the root page"
  step "I sign up via facebook"
  @user = Presenters::UserPresenter.new(facebook_user_with_profile_complete, self)
end

Given(/^I am a registered user$/) do
  @user = Presenters::UserPresenter.new(create(:user), self)
end

When(/^I go to the root page$/) do
  visit root_path
end

When(/^I sign up via facebook$/) do
  click_on t('landing.button')
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
  current_path.should eq profile_path(facebook_user.id)
end

When(/^I go to the root path$/) do
  visit root_path
end

Then(/^I should receive a welcome email$/) do
  email = ActionMailer::Base.deliveries.last
  email.to.should include OmniAuth.config.mock_auth[:facebook][:info][:email]
end
