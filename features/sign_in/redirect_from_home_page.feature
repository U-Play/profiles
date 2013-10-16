Feature: Redirect from home page to profile
  As a user
  I want to be redirected to my profile when i go to the home page

  Scenario: First Sign in

    I should be redirected to my profile edit page if my profile is not complete

    Given I am a signed user
    When I go to the root path
    Then I should be redirected to my profile edit page

  Scenario: Second Sign in

    I should be redirected to my profile page if my profile is complete

    Given I am a signed user and my profile is complete
    When I go to the root path
    Then I should be redirected to my profile page
