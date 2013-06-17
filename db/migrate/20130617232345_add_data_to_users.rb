class AddDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      # TODO add the rest of the fields here
    end
  end
end
