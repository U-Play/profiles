class AddDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name,  null: false, default: ""
      # TODO add the rest of the fields here
    end
  end
end
