Feature: Signing up
  As a visitor or already registered user
  I want to be able to sign up
  In order to access more features

  Background:
    Given I am a visitor
    When I go to the sign up page

  Scenario: Sign up
    Given I fill the sign up form
    Then I should see that I am signed up

  Scenario: Facebook sign up
    Given I sign up via facebook
    Then I should see that I am signed up from facebook

