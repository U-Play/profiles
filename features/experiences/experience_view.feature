@experience
Feature: Experience view

  In order to have my profile complete
  As a user
  I want to see my experience

  Scenario: View someone's experiences

    Given I am a visitor
    And there is a user with experiences
    When I go to the user's profile
    Then I should see his experiences

  Scenario: View my experiences

    Given I am a signed user
    And I have experiences
    When I go to my profile
    Then I should see my experiences
