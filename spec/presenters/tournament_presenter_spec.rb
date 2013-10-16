require 'spec_helper'

module Presenters
  describe TournamentPresenter do

    context "#achievements" do
      it "does not fail without achievements" do
        tournament = create :tournament_without_achievements
        tournament_presenter = TournamentPresenter.new(tournament, view)

        tournament.achievements.should be_blank
      end
    end
  end
end
