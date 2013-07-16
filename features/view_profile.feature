Feature: Viewing a profile
  As a user
  I want to view a profile

  Scenario: View an user profile
    Given I am a visitor
    And there is a user
    When I go to the user's profile
    Then I should see his information

  Scenario: View my profile
    Given I am a signed user
    When I go to my profile
    Then I should see all my information

  Scenario: View my profile while not authenticated
    Given I am a visitor
    And   I go to my profile
    Then  I should be redirected to the sign in page
