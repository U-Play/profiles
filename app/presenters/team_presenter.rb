class TeamPresenter < RailsPresenter::Base
  present :sport
  present :sport_role
  present :tournaments

  ########## team Form helpers ##########
  def form_start_date(form)
    form.date_select  :start_date,
                      discard_month: true,
                      start_year: Time.now.year,
                      end_year: 1923,
                      prompt: h.t( 'team.form.placeholders.start_date' )
  end

  def form_end_date(form)
    form.date_select  :end_date,
                      discard_month: true,
                      start_year: Time.now.year,
                      end_year: 1923,
                      prompt: h.t( 'team.form.placeholders.end_date' )
  end

  def form_sport(form)
    form.collection_select  :sport_id,
                            selectable_sports,
                            :id,
                            :name,
                            { include_blank: h.t( 'team.form.placeholders.sport' ) }
  end

  def form_role(form)
    form.collection_select  :sport_role_id,
                            selectable_sport_roles,
                            :id,
                            :name,
                            { include_blank: h.t( 'team.form.placeholders.role' ) }
  end

  def form_name(form)
    form.text_field :name, placeholder: h.t('team.form.placeholders.name')
  end

  def form_position(form)
    form.text_field :position, placeholder: h.t('team.form.placeholders.position')
  end

  ########## Tournament Form helpers ##########
  def tour_award_month(form)
    form.select :award_month,
                h.t('date.month_names').compact.zip((1..12)),
                include_blank: h.t('team.form.placeholders.month')
  end

  def tour_award_year(form)
    form.select :award_year,
                Time.now.year.downto(1923).to_a,
                include_blank: h.t( 'team.form.placeholders.year' )
  end

  def tour_achievements(form)
    form.text_field :achievements, placeholder: h.t( 'team.form.placeholders.achievements' )
  end

  def tour_name(form)
    form.text_field :name, placeholder: h.t( 'team.form.placeholders.name' )
  end

  def tour_icon(form)
    form.collection_select :icon_id,
                           selectable_icons,
                           :id,
                           :name
  end

  def start_year
    start_date.year
  end

  def end_year
    if ongoing
      h.t('team.current_date')
    elsif end_date.present?
      year = end_date.year
      return year if year != start_year
    end
  end

  def date_range
    if ongoing
      h.t('team.date.ongoing', start: start_date.year)
    elsif end_date.present? && end_date.year == start_date.year
      h.t('team.date.single_year', year: end_date.year)
    else
      h.t('team.date.range', start: start_date.year, end: end_date.year)
    end
  end

  def title
    if persisted?
      h.t('team.form.edit.title')
    else
      h.t('team.form.new.title')
    end
  end

  def submit(form)
    form.submit h.t('team.edit.submit'), class: "button submit"
  end

  def cancel(form)
    form.submit h.t('team.edit.cancel'), class: "button cancel"
  end

  def description
    h.t 'team.description', sport: sport.name, role: sport_role.name
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
      h.t('team.date_onwards', date: start_date.year)
    else
      h.t('team.date', start_date: start_date.year, end_date: end_date.year)
    end
  end

  def edit_path
    h.edit_team_path(id)
  end

  def destroy_path
    h.team_path(id)
  end

  def edit_image
    h.image_tag('icons/edit.png')
  end

  def destroy_image
    h.image_tag('icons/destroy.png')
  end
end
