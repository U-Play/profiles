Feature: Redirect from home page to profile
  As a user
  I want to be redirected to my profile when i go to the home page

  Background:
    Given I am a signed user

  Scenario: First Sign in
    Given my profile edition is not finished
    When I go to the root path
    Then I should be redirected to my profile edit page

  Scenario: Second Sign in
    Given my profile edition is finished
    When I go to the root path
    Then I should be redirected to my profile page
