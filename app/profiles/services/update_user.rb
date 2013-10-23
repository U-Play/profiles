module Services
  class UpdateUser

    def initialize(user, new_attributes)
      @user = user
      @new_attributes = new_attributes
    end

    def update
      clean_username
      find_country
      save_user
      update_to_mixpanel
      user
    end

    def errors
      user.errors.full_messages.first
    end

    def succeeded?
      @succeeded ||= false
    end

    private

    def clean_username
      if new_attributes[:username].try(:present?)
        user.username = new_attributes[:username]
        user.username = Services::GenerateUsername.new(user).generate
        new_attributes.delete(:username)
      end
    end

    def find_country
      find_country = Services::FindCountry.new(country: new_attributes[:country])
      user.country = find_country.find
      new_attributes.delete(:country)
    end

    def save_user
      @succeeded = save_picture && save_attributes
    end

    def save_picture
      if new_attributes[:picture].present?
        picture_succeeded = user.update_attributes(picture: new_attributes[:picture])
        new_attributes.delete :picture
        picture_succeeded
      else
        true
      end
    end

    def save_attributes
      user.update_attributes(new_attributes.merge(profile_complete: true))
    end

    def update_to_mixpanel
      if succeeded?
        mixpanel = Services::MixpanelTracker.new(user: user)
        mixpanel.update_user
      end
    end

    attr_reader :user, :new_attributes, :succeeded

  end
end
