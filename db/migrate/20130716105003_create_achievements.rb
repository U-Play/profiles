class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :tournament
      t.text :achievement
      t.date :award_date
      t.references :sport_experience, :null => false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :achievements, :sport_experience_id
  end
end
