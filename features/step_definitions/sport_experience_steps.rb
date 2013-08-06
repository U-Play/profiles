def fill_experience_fields
  fill_in 'sport_experience_team', with: 'Team Zero'
  select(Date.today.year,      from: 'sport_experience_start_date_1i', visible: false)
  select(Sport.first.name,     from: 'sport_experience_sport_id',      visible: false)
  select(SportRole.first.name, from: 'sport_experience_sport_role_id', visible: false)
end

Given(/^I am at my profile's new experience page$/) do
  visit my_profile_path
  click_on 'Add new'
end

When(/^I fill in an experience$/) do
  fill_experience_fields
  click_on 'Submit'
end

Then(/^I should see a creation success message$/) do
  page.should have_content 'created successfully'
end

When(/^I leave a required field blank for an experience$/) do
  fill_in 'sport_experience_team', with: ''
  click_on 'Submit'
end

When(/^I fill in an experience with an achievement$/) do
  fill_experience_fields
  click_on 'Add more'
  find(:css, "input[id^='sport_experience_achievements_attributes_'][id$='_achievement']").set("MVP")
  find(:css, "input[id^='sport_experience_achievements_attributes_'][id$='_tournament']").set("Trofeu Reitor")
  find(:css, "select[id^='sport_experience_achievements_attributes_'][id$='_award_date_1i']").select(Date.today.year)
  click_on 'Submit'
end

Given(/^I have an experience$/) do
  @experience = create(:sport_experience, user_id: @user.id)
end

Given(/^I am at an experience's edit page$/) do
  visit edit_sport_experience_path(@experience)
end

When(/^I edit the experience's sport$/) do
  select(Sport.last.name,     from: 'sport_experience_sport_id',      visible: false)
  click_on 'Submit'
end

Then(/^I should see an edit success message$/) do
  page.should have_content 'edited successfully'
end
