class MixpanelTracker

  def initialize(user: nil)
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

  def update_user
      tracker.people.set(user.id, {
          '$first_name'       => user.first_name,
          '$last_name'        => user.last_name,
          '$email'            => user.email,
          '$university'       => user.university,
          '$country'          => user.country
      });
      tracker.track(user.id, MIXPANEL_EVENT['updated_profile'])
  end

  private 
  
  attr_reader :tracker, :user

end
