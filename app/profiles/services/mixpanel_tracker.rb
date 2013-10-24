module Services
  class MixpanelTracker

    include Rails.application.routes.url_helpers

    def initialize(user: user)
      @user = user

      if defined?(MIXPANEL_TOKEN)
        @tracker = Mixpanel::Tracker.new(MIXPANEL_TOKEN)
      else
        @tracker = DummyMixpanel.new
      end
    end

    def add_team
        tracker.track(user.id, MIXPANEL_EVENT['add_team'])
    end

    def update_team
        tracker.track(user.id, MIXPANEL_EVENT['update_team'])
    end

    def register_user
        tracker.track(user.id, MIXPANEL_EVENT['sign_in'])
    end

    def default_url_options
      ActionMailer::Base.default_url_options
    end

    def update_user
        tracker.people.set(user.id, {
            '$first_name'       => user.first_name,
            '$last_name'        => user.last_name,
            '$email'            => user.email,
            '$university'       => user.university,
            '$country'          => user.country,
            'User ID'           => user.id,
            '$username'         => user.username,
            'Profile URL'       => profile_url(user.id)
        });
        tracker.track(user.id, MIXPANEL_EVENT['updated_profile'])
    end

    private

    attr_reader :tracker, :user

  end
end
