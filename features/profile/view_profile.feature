Feature: View a profile
  As a user
  I want to view a profile

  Scenario: View a user's profile via its id
    Given I am a visitor
    And there is a user
    When I go to the user's profile via its id
    Then I should see his information

  Scenario: Visit a user's profile via its username
    Given I am a visitor
    And there is a user with username
    When I go to the user's profile via its username
    Then I should see his information

  Scenario: View my profile
    Given I am a signed user
    When I go to my profile
    Then I should see all my information

  Scenario: View my profile while not authenticated
    Given I am a visitor
    And   I go to my profile
    Then  I should be redirected to the root page
