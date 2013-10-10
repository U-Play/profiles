require 'spec_helper'

describe ApplicationHelper do
  context '#present' do
    it 'instantiates a presenter' do
      present(build(:user)).should be_a(Presenters::UserPresenter)
    end

    it 'returns the same object, if it already is a presenter' do
      presenter = Presenters::UserPresenter.new(build(:user), view)

      present(presenter).should == presenter
    end

    it 'converts an array of models to array of presenters' do
      models = [build(:user), build(:user)]

      present(models).first.should be_a(Presenters::UserPresenter)
    end
  end
end
