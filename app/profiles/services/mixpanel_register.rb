module Services
  class MixpanelRegister
    def initialize(user)
      @user = user
      @tracker = Mixpanel::Tracker.new(ACCOUNTS['mixpanel']['token']) 
    end

    def register
      tracker.people.set(user.id, {
          '$first_name'       => user.first_name,
          '$last_name'        => user.last_name,
          '$email'            => user.email
      });
    end

    private

    attr_reader :user, :tracker
  end
end
