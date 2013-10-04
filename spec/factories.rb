FactoryGirl.define do

  factory :authorization do
    first_name 'John'
    last_name 'Doe'
    uid '12345'
    token '54321'
    email 'email@dummy.com'

    factory :facebook_authorization do
      provider :facebook
    end
  end

  factory :user do
    sequence(:first_name) {|n| "#{n}Jonh"}
    sequence(:last_name) {|n| "#{n}Doe"}
    gender 'male'
    birth_date Time.now
    sequence(:email) {|n| "#{n}email@dummy.com"}
    password 'randompassword'

    factory :user_with_username do
      sequence(:username) {|n| "username#{n}"}
    end

    factory :user_with_dirty_username do
      sequence(:username) {|n| "usernäme #{n}"}
    end
  end

  factory :sport do
    name 'Yet Another Sport'
    description 'Just for fun'
  end

  factory :team do
    association :sport
    association :sport_role
    association :user
    name 'UM'
    position 'GK'
    start_date Time.now
    end_date Time.now
    ongoing false
  end

  factory :sport_role do
    name 'Yet Another Sport Role'
    description 'Just a role'
  end

  factory :tournament_without_achievements, class: Tournament do
    association :team
    association :icon
    sequence(:name) {|n| "#{n} WUC"}
    award_date Date.today
    award_year Date.today.year
  end

  factory :tournament do
    association :team
    association :icon
    sequence(:name) {|n| "#{n} WUC"}
    achievements '1st place, MVP'
    award_date Date.today
    award_year Date.today.year
  end

  factory :icon do
    sequence(:name) {|n| "#{n}st"}
  end
end
