@experience @management
Feature: Experience Management

  In order to update my experiences
  As a user
  I want to be able to edit experiences

  Background:
    Given I am a signed user
    And I have an experience

  Scenario: Edit experience

    I should be able to edit an existing experience

    Given I am at an experience's edit page
    When I edit the experience's sport
    Then I should see an edit success message
    And I should be redirected to my profile page

  #@javascript
  #Scenario: Edit experience with required field not filled

    #I shouldn't be able to edit an experience if a required field is not filled

    #When I leave a required field blank for an experience
    #Then I should see a failure message

  Scenario: Cancel experience edition

    I should be able to cancel the edition of an experience

    When I remove a required field
    And I cancel the edition
    Then I should be redirected to my profile page

  @asd
  Scenario: Delete experience

    I should be able to delete an experience

    When I go to my profile
    When I delete the experience
    Then I should see a deletion success message
    And I should be redirected to my profile page
