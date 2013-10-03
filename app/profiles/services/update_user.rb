module Services
  class UpdateUser

    def initialize(user, new_attributes)
      @user = user
      @new_attributes = new_attributes
    end

    def update
      save_user
      update_to_mixpanel
    end

    def errors
      user.errors.full_messages.first
    end

    def succeeded?
      @succeeded ||= false
    end

    private

    def save_user
      @succeeded = user.update_attributes(new_attributes.merge(profile_complete: true))
    end

    def update_to_mixpanel
      if succeeded?
        @mixpanel = ::MixpanelTracker::UpdateUser.new user
        @mixpanel.update
      end
    end

    attr_reader :user, :new_attributes, :succeeded

  end
end
