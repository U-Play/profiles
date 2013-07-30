Feature: Sign up redirect
  As a visitor or already registered user
  I want to be redirected to the correct page on sign up
  In order to get easier access to content

  Background:
    Given I am a visitor


  Scenario: First Sign in
    When I go to the sign in page
    And I sign up via facebook
    Then I should be redirected to my profile edit page

  Scenario: Second Sign in
    After editing my profile I should be redirected to my profile page on sign in

    When I go to the sign in page
    And I sign up via facebook
    And I update my information
    And I sign out
    And I go to the sign in page
    And I sign up via facebook
    Then I should be redirected to my profile page
