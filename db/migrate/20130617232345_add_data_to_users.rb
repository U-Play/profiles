class AddDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name,  null: false, default: ""
      t.date :birth_date
      t.text :bio
      t.string :facebook_link
      t.string :twitter_handle
      t.attachment :picture
    end
  end
end
