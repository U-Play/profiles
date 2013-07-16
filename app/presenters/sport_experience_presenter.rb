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
end
