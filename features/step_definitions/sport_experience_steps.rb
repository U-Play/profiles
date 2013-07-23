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

Then(/^I should be redirected to my profile page$/) do
  current_path.should eq my_profile_path
end

When(/^I leave a required field blank for an experience$/) do
  fill_in 'sport_experience_team', with: 'Team Zero'
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
