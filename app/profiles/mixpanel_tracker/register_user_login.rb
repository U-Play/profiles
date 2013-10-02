module MixpanelTracker
  class RegisterUserLogin
    include Base

    def initialize(user)
      @user = user
    end

    def register
      tracker.track(user.id, MIXPANEL_EVENT['sign_up'])
    end

    private

    attr_reader :user, :tracker
  end
end
