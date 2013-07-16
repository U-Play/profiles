@sport_experience @creation
Feature: Sport Experience Creation

	In order to have sport experience stored
	As a user
	I want to be able to add my sport experience

  Background:
    Given I am a signed user
		And I am at my profile's new experience page

	Scenario: Add sport experience

		I should be able to add a new sport experience

		When I fill in an experience
		Then I should see a creation success message
    And I should be redirected to my profile page

	Scenario: Edit user's information with required field not filled

    I shouldn't be able to edit my information if a required field is not filled

		When I leave a required field blank for an experience
		Then I should see a failure message
