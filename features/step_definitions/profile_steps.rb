def facebook_user
  user = User.where(email: OmniAuth.config.mock_auth[:facebook].info.email).first
  UserPresenter.new(user, self)
end

def facebook_user_with_username
  user = User.where(email: OmniAuth.config.mock_auth[:facebook].info.email).first
  user.update_attributes username: 'username'
  UserPresenter.new(user, self)
end

def facebook_user_with_profile_complete
  user = User.where(email: OmniAuth.config.mock_auth[:facebook].info.email).first
  attrs = {university: 'UM', country: t(:PT, scope: :countries), profile_complete: true}
  user.update_attributes attrs
  UserPresenter.new(user, self)
end

def user_edit_changes
  changes = Hash.new
  changes['user_first_name'] = 'New Name'
  changes['user_university'] = 'UM'
  changes
end

Given(/^I am at my profile's edit page$/) do
  visit edit_my_profile_path
end

Given(/^there is a user$/) do
  @user = UserPresenter.new(create(:user), self)
end

Given(/^there is a user with teams$/) do
  team = create(:team)
  @user = UserPresenter.new(team.user, self)
end

Given(/^I have teams$/) do
  2.times do
    step "I am at my profile's new team page"
    step "I fill in a team"
  end
end

When(/^I go to the user's profile$/) do
  visit profile_path(@user.id)
end

When(/^I visit the user's url$/) do
  step "I go to the user's profile"
end

When(/^I go to my profile$/) do
  visit my_profile_path
end

Then(/^I should see (?:his|all my) information$/) do
  page.should have_content @user.full_name
end

Then(/^I should see my facebook name$/) do
  page.should have_content facebook_user.full_name
end

When(/^I update my information$/) do
  @changes = user_edit_changes
  @changes.each { |field, value| fill_in field, with: value }
  select t(:PT, scope: :countries), from: 'user_country'
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

Then(/^I should be redirected to the root page$/) do
  current_path.should eq root_path
end

Then(/^I should see (?:his|my) teams$/) do
  @user.teams.each_with_index do |team, index|
    selector = all(".team")[index]
    selector.should have_content team.team
    selector.should have_content team.sport.name
    selector.should have_content team.sport_role.name
  end
end

When(/^I click the user's picture$/) do
  find('.profile_picture').click
end

Then(/^I should be redirected to the user's profile page$/) do
  current_path.should eq profile_path(@user.id)
end

Then(/^I should see a 'share on facebook' button$/) do
  page.should have_content I18n.t('share.facebook.button')
end

Given(/^there is a user with username$/) do
  @user = UserPresenter.new(create(:user_with_username), self)
end

When(/^I go to the user's profile via its id$/) do
  visit profile_path(@user.id)
end

When(/^I go to the user's profile via its username$/) do
  visit username_path(@user.username)
end
