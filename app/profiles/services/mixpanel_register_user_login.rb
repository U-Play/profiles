module Services
  class MixpanelRegisterUserLogin

    def initialize(user)
      @user = user
      @tracker = Mixpanel::Tracker.new(ACCOUNTS['mixpanel']['token'])
    end

    def register
      tracker.track(user.id, 
    end

    private

    attr_reader :user, :tracker
  end
end
