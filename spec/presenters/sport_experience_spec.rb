require 'spec_helper'

describe SportExperiencePresenter do

  context "#selectable_sports" do
    it "selects all sports" do
      sport_experience = build :sport_experience
      presenter = SportExperiencePresenter.new(sport_experience, view)
      presenter.selectable_sports.map(&:name).should eq ['Yet Another Sport']
    end
  end

  context "#selectable_sport_roles" do
    it "selects all sport roles" do
      sport_experience = build :sport_experience
      presenter = SportExperiencePresenter.new(sport_experience, view)

      presenter.selectable_sport_roles.map(&:name).should eq ['Yet Another Sport Role']
    end
  end

  context "#date" do
    it "returns the correct string if there is no end date" do
        sport_experience = build(:sport_experience, end_date: nil)
        presenter = SportExperiencePresenter.new(sport_experience, view)

        presenter.date.should eq t 'sport_experience.date_onwards',
          date: sport_experience.start_date.year
    end

    it "returns the correct string if there is begin and end date" do
        sport_experience = build(:sport_experience)
        presenter = SportExperiencePresenter.new(sport_experience, view)

        presenter.date.should eq t 'sport_experience.date',
          start_date: sport_experience.start_date.year,
          end_date: sport_experience.end_date.year
    end
  end

end
