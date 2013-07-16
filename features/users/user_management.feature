@user @management
Feature: User management

	In order to have the user's information updated
	As a user
	I want to be able to edit my user information

  Background:
    Given I am a signed user
		And I am at my profile's edit page


	Scenario: Edit user's information

		I should be able to edit my information

		When I update my information
		Then I should see a success message
    And I should see my updated information

	Scenario: Edit user's information with required field no filled

    I shouldn't be able to edit my information if a required field is not filled

		When I leave a required field blank
		Then I should see a failure message
