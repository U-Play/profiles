class SportExperiencePresenter < RailsPresenter::Base
  present :sport
  present :sport_role
  present :achievements

  def achv_award_date(achv_form)
    achv_form.date_select :award_date, 
                          discard_month: true, 
                          start_year: 1923, 
                          end_year: Time.now.year, 
                          prompt: h.t( 'experience.form.placeholders.year' )
  end

  def remove_achv(achv_form)
    achv_form.link_to_remove h.t( 'experience.form.labels.remove' )
  end

  def achv_achievement(achv_form)
    achv_form.text_field :achievement, placeholder: h.t( 'experience.form.placeholders.achievement' )
  end

  def achv_tournament(achv_form)
    achv_form.text_field :tournament, placeholder: h.t( 'experience.form.placeholders.tournament' )
  end

  def achv_icon(achv_form)
    achv_form.select :icon, selectable_icons, prompt: h.t( 'experience.form.placeholders.icon' )
  end

  def start_year
    start_date.year
  end

  def end_year
    if end_date.present?
      year = end_date.year
      return year if year != start_year
    else
      h.t('experience.date_current')
    end
  end

  def description
    h.t 'experience.description', sport: sport.name, role: sport_role.name, university: university
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

  def selectable_icons
    @icons = [
      ['3rd', 'bronze']
    ]
  end

  def date
    if end_date.nil?
      h.t('experience.date_onwards', date: start_date.year)
    else
      h.t('experience.date', start_date: start_date.year, end_date: end_date.year)
    end
  end
end
