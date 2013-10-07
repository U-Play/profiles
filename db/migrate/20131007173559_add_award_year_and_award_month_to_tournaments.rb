class AddAwardYearAndAwardMonthToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :award_year, :integer
    add_column :tournaments, :award_month, :integer

    Rake::Task['db:populate_award_year'].invoke

    change_column :tournaments, :award_year, :integer, null: false
  end
end
