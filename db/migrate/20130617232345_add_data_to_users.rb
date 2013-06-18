class AddDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      # TODO add the rest of the fields here
    end
  end
end
