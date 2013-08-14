class CreateSportExperiences < ActiveRecord::Migration
  def change
    create_table :sport_experiences do |t|
      t.string :university
      t.string :position
      t.string :team
      t.date :start_date
      t.date :end_date
      t.boolean :ongoing, default: false
      t.references :sport_role, :null => false
      t.references :sport, :null => false
      t.references :user, :null => false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :sport_experiences, :sport_role_id
    add_index :sport_experiences, :sport_id
    add_index :sport_experiences, :user_id
  end
end
