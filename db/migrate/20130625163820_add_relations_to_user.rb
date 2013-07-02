class AddRelationsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :country_id
      t.integer :university_id

      t.index :country_id
      t.index :university_id
    end
  end
end
