module Services
  class FindHighlightedProfiles

    def initialize()
      @profiles = []
    end

    def find
      get_random_profiles
    end

    private

    def get_random_profiles
      profile_ids = ENV['HIGHLIGHTED_PROFILES_IDS'].split(",").map(&:to_i)
      selectable_profiles = User.where(id: profile_ids)
      @profiles = selectable_profiles.sample(ENV['MAX_HIGHLIGHTED_PROFILES'].to_i)
    end

    attr_reader :profiles

  end
end
