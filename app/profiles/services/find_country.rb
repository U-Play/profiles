module Services
  class FindCountry

    def initialize(country: country)
      @country = country
    end

    def find
      find_country_by_name || find_country_by_alpha2
    end

    private

    attr_reader :country

    def find_country_by_name
      Country.find_by_name(country).try(:first)
    end

    def find_country_by_alpha2
      Country.find_by_alpha2(country).try(:first)
    end

  end
end
