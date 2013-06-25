Feature: Viewing a profile
  As a user
  I want to view a profile

  Scenario: View an athlete profile
    Given I am a user
    And there is an athlete
    When I go to the athlete's profile
    Then I should see his information

  Scenario: View my athlete profile
    Given I am a signed user
    When I go to my profile
    Then I should see all my information
