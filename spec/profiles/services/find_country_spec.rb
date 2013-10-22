require 'spec_helper'

describe Services::FindCountry do
  it 'returns nil when country is nil' do
    clean_country = Services::FindCountry.new(country: nil)

    clean_country.find.should be_nil
  end

  it 'returns the country uppercased when the argument is an alpha2' do
    country = 'pt'
    clean_country = Services::FindCountry.new(country: country)

    clean_country.find.should eql country.upcase
  end

  it 'returns the alpha2 when argument is full name' do
    country_name = "Portugal"
    country = Country.find_by_name(country_name)
    clean_country = Services::FindCountry.new(country: country_name)

    clean_country.find.should eql country.first
  end
end
