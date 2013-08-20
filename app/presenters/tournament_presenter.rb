class TournamentPresenter < RailsPresenter::Base
  def nil_formatter
    nil
  end

  def icon
    h.image_tag "tournament_icons/#{super.name}.png"
  end

  def achievements
    super.titleize
  end
end
