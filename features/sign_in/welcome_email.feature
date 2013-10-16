Feature: Welcome email
  As a visitor
  When I sign up
  I want to receive a welcome email

  @email
  Scenario: Sign up
    Give I am a visitor
    When I go to the root page
    And I sign up via facebook
    Then I should receive a welcome email
