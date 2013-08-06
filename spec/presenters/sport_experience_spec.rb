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

  context "#start_year" do
    it "returns the year of the start date" do
      sport_experience = build(:sport_experience)
      presenter = SportExperiencePresenter.new(sport_experience, view)

      presenter.start_year.should eq sport_experience.start_date.year
    end
  end

  context "#end_year" do
    it "returns a 'present' string if ongoing is true" do
      sport_experience = build(:sport_experience, end_date: nil, ongoing: true)
      presenter = SportExperiencePresenter.new(sport_experience, view)

      presenter.end_year.should eq t('experience.date_present')
    end

    context "end date exists" do
      it "returns the year of the end date if it is after start date" do
        sport_experience = build(:sport_experience, start_date: Time.now, end_date: Time.now+1.year)
        presenter = SportExperiencePresenter.new(sport_experience, view)

        presenter.end_year.should eq sport_experience.end_date.year
      end

      it "returns nothing if end year is the same as start year" do
        sport_experience = build(:sport_experience, start_date: Time.now, end_date: Time.now)
        presenter = SportExperiencePresenter.new(sport_experience, view)

        presenter.end_year.should be_nil
      end
    end
  end

end
