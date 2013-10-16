@referrals
Feature: User referrals

  In order to increase my referrals count
  Users should be able to register using my referral url

  Scenario: Someone registers using my referral url

    Given I am a registered user
    When someone registers using my referral url
    Then my subscriptions count should increment

  Scenario: A existing user registers using my referral url

    Given I am a registered user
    When an existing user registers using my referral url
    Then my subscriptions count should not increment
