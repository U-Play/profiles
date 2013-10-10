def fill_team_fields
  fill_in 'team_name', with: 'Team Zero'
  select(Date.today.year,      from: 'team_start_date_1i')
  select(Sport.first.name,     from: 'team_sport_id')
  select(SportRole.first.name, from: 'team_sport_role_id')
end

def fill_tournament_fields
  tournament = build :tournament
  find(:css, "input[id^='team_tournaments_attributes_'][id$='_achievements']", ).set(tournament.achievements)
  find(:css, "input[id^='team_tournaments_attributes_'][id$='_name']").set(tournament.name)
  find(:css, "select[id^='team_tournaments_attributes_'][id$='_award_year']").select(tournament.award_year)
end

def submit_team_form
  # click_button I18n.t('team.edit.submit')
  #
  # this should work, but doesn't, probably a webkit bug:
  # https://github.com/thoughtbot/capybara-webkit/issues/494
  #
  # workaround below:
  page.execute_script("$('form#new_team').submit()")
end

Given(/^I am at my profile's new team page$/) do
  visit my_profile_path
  click_on I18n.t('team.add_new')
end

When(/^I fill in a team$/) do
  fill_team_fields
  #click_on I18n.t('team.edit.submit')
  submit_team_form
end

Then(/^I should see a creation success message$/) do
  page.should have_content 'created successfully'
end

When(/^I leave a required field blank for a team$/) do
  fill_in 'team_name', with: ''
  #click_on I18n.t('team.edit.submit')
  submit_team_form
end

When(/^I fill in a team with a tournament$/) do
  fill_team_fields
  #click_on I18n.t('team.form.labels.add_more')
  page.execute_script("$('form#new_team .add-button').click()")
  fill_tournament_fields
  submit_team_form
end

Given(/^I have a team$/) do
  @team = create(:team, user_id: @user.id)
end

Given(/^I am at a team's edit page$/) do
  binding.pry
  visit edit_team_path(@team)
end

When(/^I edit the team's sport$/) do
  select(Sport.last.name, from: 'team_sport_id')
  click_on 'Submit'
end

Then(/^I should see an edit success message$/) do
  page.should have_content 'edited successfully'
end

When(/^I remove a required field$/) do
  fill_in 'team_name', with: ''
end

When(/^I cancel the edition$/) do
    click_on t('team.edit.cancel')
end

When(/^I delete the team$/) do
  click_on t('team.destroy.button')
end

Then (/^I should see a deletion success message$/) do
  page.should have_content t('team.destroy.success')
end
