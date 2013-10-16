@awip
Feature: Navigate via user picture to user profile
  As a user
  I want to be able to click on a user picture
  In order to access its profile page

  Scenario: Click on another user's picture
    Given there is a user
    When I go to the user's profile
    And I click the user's picture
    Then I should be redirected to the user's profile page

  Scenario: Click on my picture
    Given I am a signed user
    When I go to my profile
    And I click the user's picture
    Then I should be redirected to my profile page
