@team
Feature: team view

  In order to have my profile complete
  As a user
  I want to see my team

  Scenario: View someone's teams

    Given I am a visitor
    And there is a user with teams
    When I go to the user's profile
    Then I should see his teams

  @javascript
  Scenario: View my teams

    Given I am a signed user
    And I have teams
    When I go to my profile
    Then I should see my teams
