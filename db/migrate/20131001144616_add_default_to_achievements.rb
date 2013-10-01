class AddDefaultToAchievements < ActiveRecord::Migration
  def change
    change_column :tournaments, :achievements, :text, null: false, default: ""
  end
end
