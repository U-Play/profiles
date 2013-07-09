require 'spec_helper'

describe UserPresenter do

  context "#full_name" do
    it "merges first and last name" do
      user = build :user, first_name: 'first', last_name: 'last'
      presenter = UserPresenter.new(user, view)

      presenter.full_name.should eq 'first last'
    end
  end

end
