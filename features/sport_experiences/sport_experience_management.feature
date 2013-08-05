@sport_experience @management
Feature: Sport Experience Management

  In order to update my sport experiences
  As a user
  I want to be able to edit sport experiences

  Background:
    Given I am a signed user
    And I have an experience
    And I am at an experience's edit page

	Scenario: Edit sport experience

    I should be able to edit an existing sport experience

    When I edit the experience's sport
    Then I should see an edit success message
    And I should be redirected to my profile page

  Scenario: Edit sport experience with required field not filled

    I shouldn't be able to edit an experience if a required field is not filled

    When I leave a required field blank for an experience
    Then I should see a failure message
