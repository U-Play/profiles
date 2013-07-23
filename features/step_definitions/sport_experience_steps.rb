Given(/^I am at my profile's new experience page$/) do
  visit my_profile_path
  click_on 'Add new'
end

When(/^I fill in an experience$/) do
  fill_in 'sport_experience_team', with: 'Team Zero'
  select(Date.today.year, from: 'sport_experience_start_date_1i')
  within '#sport_experience_sport_id' do
    find("option[value='#{Sport.first.id}']").select_option
  end
  within '#sport_experience_sport_role_id' do
    find("option[value='#{SportRole.first.id}']").select_option
  end
  click_on 'Submit'
end

Then(/^I should see a creation success message$/) do
  page.should have_content 'created successfully'
end

Then(/^I should be redirected to my profile page$/) do
  current_url.should eq my_profile_url
end

When(/^I leave a required field blank for an experience$/) do
  fill_in 'sport_experience_team', with: 'Team Zero'
  click_on 'Submit'
end

When(/^I fill in an achievement$/) do
  #TODO click on link
  # click_on 'Add More'
  #TODO fill achievement, tournament and year. careful with field name which varies
end
