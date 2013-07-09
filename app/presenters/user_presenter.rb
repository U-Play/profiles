class UserPresenter < RailsPresenter::Base

  def nil_formatter
    nil
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
