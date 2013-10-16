class CreateSportRoles < ActiveRecord::Migration
  def change
    create_table :sport_roles do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
