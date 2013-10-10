require 'spec_helper'
require 'presenters/base'

class DummyModel
end

module Presenters
  class DummyModelPresenter < Base
  end

  describe 'Base' do
    context '#target' do
      it 'returns the original object' do
        model = DummyModel.new
        presenter = Presenters
        presenter = DummyModelPresenter.new(model, view)

        presenter.target.should eq model
      end
    end

    context 'instance method delegation' do
      it 'delegates unkown methods to base class' do
        model = DummyModel.new
        model.stub(:dummy_method).and_return(true)
        presenter = DummyModelPresenter.new(model, view)

        presenter.dummy_method.should be_true
      end
    end

    context 'class method delegation' do
      it 'delegates unknown class methods to base class' do
        DummyModel.stub(:dummy_class_method).and_return(true)

        Presenters::DummyModelPresenter.dummy_class_method.should be_true
      end
    end
  end
end
