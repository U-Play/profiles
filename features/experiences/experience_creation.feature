@experience @creation
Feature: Experience Creation

  In order to have experiences
  As a user
  I want to be able to add experiences

  Background:
    Given I am a signed user
    And I am at my profile's new experience page

  @javascript
	Scenario: Add experience with no tournaments

    I should be able to add a new experience with no tournaments

    When I fill in an experience
    Then I should see a creation success message
    And I should be redirected to my profile page

  @javascript
	Scenario: Add experience with tournaments

    I should be able to add a new experience with tournaments

    When I fill in an experience with a tournament
    Then I should see a creation success message
    And I should be redirected to my profile page

  Scenario: Add experience with required field not filled

    I shouldn't be able to add an experience if a required field is not filled

    When I leave a required field blank for an experience
    Then I should see a failure message
