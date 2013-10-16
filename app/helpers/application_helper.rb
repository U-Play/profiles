module ApplicationHelper
  def present(object, klass = nil)
    if object.nil?
      nil
    elsif object.is_a?(Array) || object.is_a?(ActiveRecord::Relation)
      object.map { |element| present_single(element, klass) }
    else
      present_single(object, klass)
    end
  end

  private

  def present_single(object, klass)
    if object.class.name =~ /^Presenters::/
      object
    else
      klass ||= "Presenters::#{object.class}Presenter".constantize
      klass.new(object, self)
    end
  end
end
