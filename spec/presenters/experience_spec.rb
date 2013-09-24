require 'spec_helper'

describe ExperiencePresenter do

  context "#tournaments" do
    it "returns all tournaments by order" do
      experience = build :experience
      presenter = ExperiencePresenter.new(experience, view)
      ordered_tournaments = experience.tournaments.sort {|a,b| b.award_date <=> a.award_date }

      presenter.tournaments == ordered_tournaments
    end
  end

  context "#selectable_sports" do
    it "selects all sports" do
      experience = build :experience
      presenter = ExperiencePresenter.new(experience, view)
      presenter.selectable_sports.map(&:name).should eq ['Yet Another Sport']
    end
  end

  context "#selectable_sport_roles" do
    it "selects all sport roles" do
      experience = build :experience
      presenter = ExperiencePresenter.new(experience, view)

      presenter.selectable_sport_roles.map(&:name).should eq ['Yet Another Sport Role']
    end
  end

  context "#start_year" do
    it "returns the year of the start date" do
      experience = build(:experience)
      presenter = ExperiencePresenter.new(experience, view)

      presenter.start_year.should eq experience.start_date.year
    end
  end

  context "#end_year" do
    it "returns a 'present' string if ongoing is true" do
      experience = build(:experience, end_date: nil, ongoing: true)
      presenter = ExperiencePresenter.new(experience, view)

      presenter.end_year.should eq t('experience.current_date')
    end

    context "end date exists" do
      it "returns the year of the end date if it is after start date" do
        experience = build(:experience, start_date: Time.now, end_date: Time.now+1.year)
        presenter = ExperiencePresenter.new(experience, view)

        presenter.end_year.should eq experience.end_date.year
      end

      it "returns nothing if end year is the same as start year" do
        experience = build(:experience, start_date: Time.now, end_date: Time.now)
        presenter = ExperiencePresenter.new(experience, view)

        presenter.end_year.should be_nil
      end
    end
  end

end
