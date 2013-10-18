namespace :db do
  desc "Populates tournament's award_year and award_month from award_date"
  task :populate_award_year => :environment do
    if ['development', 'test'].include? Rails.env
      Tournament.with_deleted.where(award_year: nil).update_all ["award_year = strftime(?, award_date)", '%Y']
    elsif ['production', 'staging'].include? Rails.env
      Tournament.with_deleted.where(award_year: nil).update_all ["award_year = EXTRACT(YEAR FROM award_date)"]
    end
  end
end
