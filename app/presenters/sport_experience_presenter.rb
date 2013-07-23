class SportExperiencePresenter < RailsPresenter::Base
  present :sport
  present :sport_role
  present :achievements

  def start_year
    start_date.year
  end

  def end_year
    if end_date.present?
      year = end_date.year
      return year if year != start_year
    else
      h.t('sport_experience.date_current')
    end
  end

  def description
    h.t 'sport_experience.description', sport: sport.name, role: sport_role.name, university: university
  end

  def nil_formatter
    nil
  end

  def selectable_sports
    @sports ||= Sport.all
  end

  def selectable_sport_roles
    @sport_roles ||= SportRole.all
  end
end
