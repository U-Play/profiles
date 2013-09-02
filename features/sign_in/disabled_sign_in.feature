@a
Feature: Disabled Sign In
  As a visitor or already registered user
  I want to be redirected to the correct page on sign up

  Background:
    Given I am a visitor

  Scenario: Sign in enabled
    Given Sign in is enabled
    When I go to the root page
    And I sign up via facebook
    Then I should be redirected to my profile edit page

  Scenario: Sign in disabled
    Given Sign in is disabled
    When I go to the root page
    And I sign up via facebook
    Then I should see that I am not able to sign in
