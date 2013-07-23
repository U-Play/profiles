@sport_experience @creation
Feature: Sport Experience Creation

  In order to have sport experiences
  As a user
  I want to be able to add sport experiences

  Background:
    Given I am a signed user
    And I am at my profile's new experience page

  @javascript
	Scenario: Add sport experience with no achievements

    I should be able to add a new sport experience with no achievements

    When I fill in an experience
    Then I should see a creation success message
    And I should be redirected to my profile page

  @javascript
	Scenario: Add sport experience with achievements

    I should be able to add a new sport experience with achievements

    When I fill in an experience with an achievement
    Then I should see a creation success message
    And I should be redirected to my profile page

  Scenario: Add sport experience with required field not filled

    I shouldn't be able to add an experience if a required field is not filled

    When I leave a required field blank for an experience
    Then I should see a failure message
