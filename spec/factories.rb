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
    bio "I'm awesome!"
    birth_date Time.now
    sequence(:email) {|n| "#{n}email@dummy.com"}
    password 'randompassword'
  end

  factory :sport do
    name 'Yet Another Sport'
    description 'Just for fun'
  end

  factory :sport_experience do
    association :sport
    association :sport_role
    association :user
    team 'UM'
    position 'GK'
    start_date Time.now
    end_date Time.now
    ongoing false
  end

  factory :sport_role do
    name 'Yet Another Sport Role'
    description 'Just a role'
  end

  factory :tournament do
    association :sport_experience
    name 'WUC'
    achievements '1st place, MVP'
    award_date Date.today
    icon '1st'
  end
end
