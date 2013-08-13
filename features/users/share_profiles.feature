Feature: Share profiles on social networks

  In order to share profiles in social networks
  As a user
  I should be able to use the social networks share buttons

  Background:

    Given I am a signed user
    When I go to my profile

  Scenario: I can see the share on facebook button

    Then I should see a 'share on facebook' button

  Scenario: I can see the share on twitter button

    Then I should see a 'share on twitter' button
