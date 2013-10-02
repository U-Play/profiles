module Services
  class MixpanelUpdateTeam

    def initialize(user)
      @user = user
    end

    def update
      if !Rails.env.test?
        tracker = Mixpanel::Tracker.new(ACCOUNTS['mixpanel']['token'])
        tracker.track(user.id, MIXPANEL_EVENT['add']['team'])
      end
    end

    private
    
    attr_reader :user
  end
end
