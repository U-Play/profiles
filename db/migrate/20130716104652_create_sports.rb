class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
