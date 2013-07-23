class SportExperiencePresenter < RailsPresenter::Base
  present :sport
  present :sport_role
  present :achievements

  def nil_formatter
    nil
  end

  def selectable_sports
    @sports ||= Sport.all
  end

  def selectable_sport_roles
    @sport_roles ||= SportRole.all
  end

  def date
    if end_date.nil?
      h.t('sport_experience.date_onwards', date: start_date.year)
    else
      h.t('sport_experience.date', start_date: start_date.year, end_date: end_date.year)
    end
  end
end
