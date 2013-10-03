class ExperiencePresenter < RailsPresenter::Base
  present :sport
  present :sport_role
  present :tournaments

  ########## Experience Form helpers ##########
  def exp_start_date(exp_form)
    exp_form.date_select  :start_date,
                          discard_month: true,
                          start_year: Time.now.year,
                          end_year: 1923,
                          prompt: h.t( 'experience.form.placeholders.start_date' )
  end

  def exp_end_date(exp_form)
    exp_form.date_select  :end_date,
                          discard_month: true,
                          start_year: Time.now.year,
                          end_year: 1923,
                          prompt: h.t( 'experience.form.placeholders.end_date' )
  end

  def exp_sport(exp_form)
    exp_form.collection_select  :sport_id,
                                selectable_sports,
                                :id,
                                :name,
                                { include_blank: h.t( 'experience.form.placeholders.sport' ) }
  end

  def exp_role(exp_form)
    exp_form.collection_select  :sport_role_id,
                                selectable_sport_roles,
                                :id,
                                :name,
                                { include_blank: h.t( 'experience.form.placeholders.role' ) }
  end

  def exp_team(exp_form)
    exp_form.text_field :team, placeholder: h.t('experience.form.placeholders.team')
  end

  def exp_position(exp_form)
    exp_form.text_field :position, placeholder: h.t('experience.form.placeholders.position')
  end

  ########## Tournament Form helpers ##########
  def tour_award_date(tour_form)
    tour_form.date_select :award_date,
                          discard_day: true,
                          start_year: Time.now.year,
                          end_year: 1923,
                          order: [:month,:year],
                          prompt: {
                            year: h.t( 'experience.form.placeholders.year'), 
                            month: h.t( 'experience.form.placeholders.month')
                          }
  end

  def tour_achievements(tour_form)
    tour_form.text_field :achievements, placeholder: h.t( 'experience.form.placeholders.achievements' )
  end

  def tour_name(tour_form)
    tour_form.text_field :name, placeholder: h.t( 'experience.form.placeholders.name' )
  end

  def tour_icon(tour_form)
    tour_form.collection_select :icon_id,
                                selectable_icons,
                                :id,
                                :name
  end

  def start_year
    start_date.year
  end

  def end_year
    if ongoing
      h.t('experience.current_date')
    elsif end_date.present?
      year = end_date.year
      return year if year != start_year
    end
  end

  def date_range
    if ongoing
      h.t('experience.date.ongoing', start: start_date.year)
    elsif end_date.present? && end_date.year == start_date.year
      h.t('experience.date.single_year', year: end_date.year)
    else
      h.t('experience.date.range', start: start_date.year, end: end_date.year)
    end
  end

  def title
    if persisted?
      h.t('experience.form.edit.title')
    else
      h.t('experience.form.new.title')
    end
  end

  def submit(form)
    form.submit h.t('experience.edit.submit'), class: "button submit"
  end

  def cancel(form)
    form.submit h.t('experience.edit.cancel'), class: "button cancel"
  end

  def description
    h.t 'experience.description', sport: sport.name, role: sport_role.name
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
    @icons ||= Icon.all
  end

  def date
    if end_date.nil?
      h.t('experience.date_onwards', date: start_date.year)
    else
      h.t('experience.date', start_date: start_date.year, end_date: end_date.year)
    end
  end

  def edit_path
    h.edit_experience_path(id)
  end

  def destroy_path
    h.experience_path(id)
  end

  def edit_image
    h.image_tag('icons/edit.png')
  end
end
