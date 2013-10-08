require 'spec_helper'

describe UserPresenter do

  context "#experiences" do
    it "returns all tournaments by order" do
      experience = create(:experience)
      create_list(:tournament, 3, experience: experience)

      presenter = ExperiencePresenter.new(experience, view)
      ordered_tournaments = experience.tournaments.sort_by {|a| [a.award_year, a.award_month]}.reverse

      presenter.tournaments == ordered_tournaments
    end
  end

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
