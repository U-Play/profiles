require 'delegate'

module Presenters
  class Base < SimpleDelegator
    extend ActiveModel::Naming

    def initialize(object, template)
      @template = template
      super(object)
    end

    def target
      __getobj__
    end

    class << self
      def method_missing(name, *args, &block)
        if model_klass.respond_to?(name)
          model_klass.send(name, *args, &block)
        else
          super
        end
      end
    end

    def self.model_klass
      self.name.split('::').last.gsub(/Presenter/, '').constantize
    end

    def self.presents(name)
      define_method(name.to_s) do
        h.present(target.send(name.to_s))
      end
    end

    def ==(other)
      self.target == other.target
    end

    private

    attr_reader :template

    def h
      template
    end

  end
end
