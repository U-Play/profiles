module MixpanelTracker
  class UpdateTeam
    include Base

    def initialize(user)
      @user = user
    end

    def update
      if !Rails.env.test?
        tracker.track(user.id, MIXPANEL_EVENT['add']['team'])
      end
    end

    private
    
    attr_reader :user
  end
end
