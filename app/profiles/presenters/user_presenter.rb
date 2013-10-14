module Presenters
  class UserPresenter < Base
    presents :teams

    def countries
      Country.all.map(&:first)
    end

    def full_name
      "#{first_name} #{last_name}".strip
    end

    def twitter
      if twitter_handle.present?
        h.link_to '', "http://twitter.com/#{twitter_handle}", class: "icon-twitter", target: '_blank'
      end
    end

    def facebook
      if facebook_link.present?
        h.link_to '', facebook_link, class: "icon-facebook", target: '_blank'
      end
    end

    def new_team
      target.teams.build
    end

    def referral_url
      h.referral_url(token)
    end

    def share_on_twitter
      link = "http://twitter.com/share?text=#{h.t('share.twitter.message').gsub(' ', '%20').gsub(' ', '%20%40')}&url=#{referral_url.gsub('http://','http://www.')}"
      h.link_to  h.t('share.twitter.button'), link, target: '_blank'
    end

    def share_on_facebook
      h.link_to h.t('share.facebook.button'), '#', "onclick" => "postToFacebook('#{referral_url}')"
    end

    def tags
      sports.uniq.map(&:name).join ', '
    end

    def location
      [university, country].compact.join(", ")
    end

    def country
      if target.country.present? && Country.find_by_alpha2(target.country)
        h.t(target.country, scope: :countries)
      end
    end

    def gender_options_for_select
      [[h.t('user.gender.male'), :male], [h.t('user.gender.female'), :female]]
    end

    def username_placeholder
      Services::GenerateUsername.new(self).generate
    end

    def set_new_team(params)
      @new_team = h.present h.signed_user.target.teams.build(params)
      @new_team.target.tournaments.build if @new_team.tournaments.empty?
      @team_hide = teams.any? && params.nil?
    end

    attr_reader :new_team, :new_team_hide

  end
end
