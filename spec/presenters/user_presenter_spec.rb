require 'spec_helper'

module Presenters
  describe UserPresenter do

    context "#teams" do
      it "returns all tournaments by order" do
        team = create(:team)
        create_list(:tournament, 3, team: team)
        presenter = TeamPresenter.new(team, view)
        ordered_tournaments = team.tournaments.sort_by {|a| [a.award_year, a.award_month]}.reverse

        presenter.tournaments.map(&:target) == ordered_tournaments
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
        team = create :team, sport: sport
        user = create :user, teams: [team, team]
        presenter = UserPresenter.new(user, view)

        presenter.tags.should eq "Pudding Eating"
      end
    end

  end
end
