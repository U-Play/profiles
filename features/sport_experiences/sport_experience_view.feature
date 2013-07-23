@sport_experience
Feature: Sport experience view

  In order to have my profile complete
  As a user
  I want to see my sport experience

  Scenario: View someone's sport experiences

    Given I am a visitor
    And there is a user with sport experiences
    When I go to the user's profile
    Then I should see his sport experiences

  Scenario: View my sport experiences

    Given I am a signed user
    And I have sport experiences
    When I go to my profile
    Then I should see my sport experiences
