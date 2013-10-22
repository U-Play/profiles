require 'spec_helper'

describe Presenters::TeamPresenter do

  context "#tournaments" do
    it "returns all tournaments by order" do
      team = build :team
      presenter = Presenters::TeamPresenter.new(team, view)
      ordered_tournaments = team.tournaments.sort_by {|a| [a.award_year, a.award_month]}.reverse

      presenter.tournaments == ordered_tournaments
    end
  end

  context "#selectable_sports" do
    it "selects all sports" do
      team = build :team
      presenter = Presenters::TeamPresenter.new(team, view)
      presenter.sports.should eq ['Yet Another Sport']
    end
  end

  context "#selectable_sport_roles" do
    it "selects all sport roles" do
      team = build :team
      presenter = Presenters::TeamPresenter.new(team, view)

      presenter.selectable_sport_roles.map(&:name).should eq ['Yet Another Sport Role']
    end
  end

  context "#start_year" do
    it "returns the year of the start date" do
      team = build(:team)
      presenter = Presenters::TeamPresenter.new(team, view)

      presenter.start_year.should eq team.start_date.year
    end
  end

  context "#end_year" do
    it "returns a 'present' string if ongoing is true" do
      team = build(:team, end_date: nil, ongoing: true)
      presenter = Presenters::TeamPresenter.new(team, view)

      presenter.end_year.should eq t('team.current_date')
    end

    context "end date exists" do
      it "returns the year of the end date if it is after start date" do
        team = build(:team, start_date: Time.now, end_date: Time.now+1.year)
        presenter = Presenters::TeamPresenter.new(team, view)

        presenter.end_year.should eq team.end_date.year
      end

      it "returns nothing if end year is the same as start year" do
        team = build(:team, start_date: Time.now, end_date: Time.now)
        presenter = Presenters::TeamPresenter.new(team, view)

        presenter.end_year.should be_nil
      end
    end
  end

end
