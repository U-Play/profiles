class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :achievements
      t.date :award_date
      t.string :icon
      t.references :sport_experience, :null => false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :tournaments, :sport_experience_id
  end
end
