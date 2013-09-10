require 'spec_helper'

describe UserPresenter do

  context "#full_name" do
    it "merges first and last name" do
      user = build :user, first_name: 'first', last_name: 'last'
      presenter = UserPresenter.new(user, view)

      presenter.full_name.should eq 'first last'
    end
  end

  context "#tags" do
    it "does not display duplicates" do
      sport = create :sport, name: 'Pudding Eating'
      experience = create :experience, sport: sport
      user = create :user, experiences: [experience, experience]
      presenter = UserPresenter.new(user, view)

      presenter.tags.should eq "Pudding Eating"
    end
  end

end
