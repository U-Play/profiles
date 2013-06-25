Given(/^I am a visitor$/) do
end

When(/^I go to the sign up page$/) do
  visit new_user_registration_path
end

When(/^I sign up via facebook$/) do
  click_on 'Sign in with Facebook'
end

When(/^I fill the sign up form$/) do
  within "#new_user" do
    fill_in 'Email', with: 'dummy@gmail.com'
    fill_in 'Password', with: 'a_password'
    fill_in 'Password confirmation', with: 'a_password'
    click_on 'Sign up'
  end
end

Then(/^I should see that I am signed up$/) do
  page.should have_content 'Welcome! You have signed up successfully'
end

Then(/^I should see that I am signed up from facebook$/) do
  page.should have_content 'Successfully authenticated from facebook account'
end


