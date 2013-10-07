namespace :db do
  desc "Populates tournament's award_year and award_month from award_date"
  task :populate_award_year => :environment do
    Tournament.where(award_year: nil).update_all ["award_year = strftime(?, award_date)", '%Y']
  end
end
