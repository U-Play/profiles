module Services
  class FindHighlightedProfiles

    def initialize()
      @profiles = []
    end

    def find
      get_profiles
      profiles
    end

    private

    def get_profiles
      if Rails.env.production?
        (0..ENV['MAX_HIGHLIGHTED_PROFILES']-1).each do |index|
          @profiles << User.find_by_id(ENV['HIGHLIGHTED_PROFILES'][index])
        end
        @profiles.compact!
      end
    end

    attr_reader :profiles

  end
end
