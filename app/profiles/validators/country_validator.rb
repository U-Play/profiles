class Validators::CountryValidator < ActiveModel::Validator
  def validate(record)
    if record.country.present? && Country.find_by_alpha2(record.country).nil?
      record.errors[:country] << I18n.t('user.edit.errors.country')
    end
  end
end
