@team @management
Feature: team Management

  In order to update my teams
  As a user
  I want to be able to edit teams

  Background:
    Given I am a signed user
    And I have a team

  Scenario: Edit team

    I should be able to edit an existing team

    Given I am at a team's edit page
    When I edit the team's sport
    Then I should see an edit success message
    And I should be redirected to my profile page

  #@javascript
  #Scenario: Edit team with required field not filled

    #I shouldn't be able to edit an team if a required field is not filled

    #When I leave a required field blank for a team
    #Then I should see a failure message

  Scenario: Cancel team edition

    I should be able to cancel the edition of an team

    Given I am at a team's edit page
    When I remove a required field
    And I cancel the edition
    Then I should be redirected to my profile page

  Scenario: Delete team

    I should be able to delete an team

    When I go to my profile
    When I delete the team
    Then I should see a deletion success message
    And I should be redirected to my profile page
