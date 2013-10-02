module Services
  class MixpanelUpdateUser
    def initialize(user)
      @user = user
    end

    def update
      if !Rails.env.test?
        tracker = Mixpanel::Tracker.new(ACCOUNTS['mixpanel']['token'])
        tracker.people.set(user.id, {
            '$first_name'       => user.first_name,
            '$last_name'        => user.last_name,
            '$email'            => user.email,
            '$university'       => user.university
        });
      end
    end

    private

    attr_reader :user
  end
end
