@team @creation
Feature: Team Creation

  In order to have teams
  As a user
  I want to be able to add teams

  Background:
    Given I am a signed user
    And I am at my profile's new team page

  #@javascript
	#Scenario: Add team with no tournaments

    #I should be able to add a new team with no tournaments

    #When I fill in a team
    #Then I should see a creation success message
    #And I should be redirected to my profile page

  #@javascript
	#Scenario: Add team with tournaments

    #I should be able to add a new team with tournaments

    #When I fill in a team with a tournament
    #Then I should see a creation success message
    #And I should be redirected to my profile page

  @javascript
  Scenario: Add team with required field not filled

    I shouldn't be able to add a team if a required field is not filled

    When I leave a required field blank for a team
    Then I should see a failure message
