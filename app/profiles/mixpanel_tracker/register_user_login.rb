module MixpanelTracker
  class RegisterUserLogin
    include Base

    def initialize(user)
      @user = user
    end

    def register
      binding.pry
      if !Rails.env.test?
        tracker.track(user.id, MIXPANEL_EVENT['sign_in'])
      end
    end

    private

    attr_reader :user
  end
end
