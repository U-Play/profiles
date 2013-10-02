class TournamentPresenter < RailsPresenter::Base
  def nil_formatter
    nil
  end

  def icon
    h.image_tag "tournament_icons/#{super.name}.png"
  end

  def achievements
    super.try :titleize
  end

  def date
    h.t('tournaments.date',
        month: h.t('date.month_names')[award_date.month],
        year: award_date.year
       )
  end
end
