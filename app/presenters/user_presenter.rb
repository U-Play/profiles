class UserPresenter < RailsPresenter::Base
  def nil_formatter
    nil
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def selectable_countries
    @country ||= Country.all
  end

  def selectable_universities
    @university ||= University.all
  end
end
