class AddDefaultToAchievements < ActiveRecord::Migration
  def change
    change_column :tournaments, :achievements, :text, default: ""
  end
end
