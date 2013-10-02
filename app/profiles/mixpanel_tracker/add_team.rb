module MixpanelTracker
  class AddTeam
    include Base

    def initialize(user)
      @user = user
    end

    def add
      if !Rails.env.test?
        tracker.track(user.id, MIXPANEL_EVENT['add']['team'])
      end
    end

    private

    attr_reader :user
  end
end
