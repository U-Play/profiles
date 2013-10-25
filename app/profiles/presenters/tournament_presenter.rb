module Presenters
  class TournamentPresenter < Base

    def icon
      h.image_tag "tournament_icons/#{super.name}.png"
    end

    def achievements
      super.try :titleize
    end

    def award_month
      target.award_month || 0
    end

    def date
      h.t('tournament.date',
          month: h.t('date.month_names')[award_month],
          year: award_year
         )
    end
  end
end
