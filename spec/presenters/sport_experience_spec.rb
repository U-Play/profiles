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

end
