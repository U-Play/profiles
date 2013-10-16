class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
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
    add_index :experiences, :sport_role_id
    add_index :experiences, :sport_id
    add_index :experiences, :user_id
  end
end
