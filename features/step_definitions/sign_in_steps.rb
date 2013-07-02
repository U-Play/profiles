Given(/^I am a visitor$/) do
end

When(/^I go to the sign in page$/) do
  visit new_user_session_path
end

When(/^I sign up via facebook$/) do
  click_on 'Sign in with Facebook'
end

Then(/^I should see that I am signed up from facebook$/) do
  page.should have_content 'Successfully authenticated from facebook account'
end


