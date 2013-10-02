module Services
  class MixpanelUpdateUser
    def initialize(user)
      @user = user
      @tracker = Mixpanel::Tracker.new(ACCOUNTS['mixpanel']['token']) if !Rails.env.test?
    end

    def update
      if !Rails.env.test?
        tracker.people.set(user.id, {
            '$first_name'       => user.first_name,
            '$last_name'        => user.last_name,
            '$email'            => user.email
        });
      end
    end

    private

    attr_reader :user, :tracker
  end
end
