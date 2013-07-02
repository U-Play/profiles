Feature: Signing up
  As a visitor or already registered user
  I want to be able to sign up
  In order to access more features

  Scenario: Facebook sign in
    Given I am a visitor
    When I go to the sign in page
    And I sign up via facebook
    Then I should see that I am signed up from facebook
