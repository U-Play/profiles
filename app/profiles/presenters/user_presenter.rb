module Presenters
  class UserPresenter < Base
    presents :teams

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
      country = self.country.present? ? I18n.t(self.country, scope: :countries) : nil
      [university, country].compact.join(", ")
    end

    def gender_options_for_select
      [[h.t('user.gender.male'), :male], [h.t('user.gender.female'), :female]]
    end

    def username_placeholder
      Services::GenerateUsername.new(self).generate
    end
  end
end
