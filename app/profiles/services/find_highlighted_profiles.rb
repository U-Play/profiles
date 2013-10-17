module Services
  class FindHighlightedProfiles

    def initialize()
      @profiles = []
    end

    def find
      get_random_profiles
      profiles
    end

    private

    def get_random_profiles
      if Rails.env.production?
        profile_ids = ENV['HIGHLIGHTED_PROFILES_IDS'].split(",").map(&:to_i)
        selected_ids = profile_ids.sample(ENV['MAX_HIGHLIGHTED_PROFILES'].to_i)
        @profiles = User.where(id: selected_ids)
      end
    end

    attr_reader :profiles

  end
end
