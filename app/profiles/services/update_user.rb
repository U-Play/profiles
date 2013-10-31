module Services
  class UpdateUser
    include Wisper::Publisher

    def initialize(user, new_attributes)
      @user = user
      @new_attributes = new_attributes
      @succeeded = false
    end

    def update
      set_attributes
      save_user
      update_to_mixpanel

      notify
    end

    def get_user
      user.reload
    end

    private

    attr_reader :user, :new_attributes, :succeeded

    def set_attributes
      clean_username
      find_country
    end

    def clean_username
      clean_username = Services::CleanUsername.new(username: new_attributes[:username])
      user.username = clean_username.clean

      new_attributes.delete(:username)
    end

    def find_country
      find_country = Services::FindCountry.new(country: new_attributes[:country])
      user.country = find_country.find

      new_attributes.delete(:country)
    end

    def save_user
      user.attributes = new_attributes.merge(profile_complete: true)
      @succeeded = user.save
    end

    def update_to_mixpanel
      if succeeded
        mixpanel = Services::MixpanelTracker.new(user: user)
        mixpanel.update_user
      end
    end

    def notify
      if succeeded
        publish(:succeeded)
      else
        publish(:failed)
      end
    end
  end
end
