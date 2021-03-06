class AddDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.text :bio
      t.string :facebook_link
      t.string :twitter_handle
      t.string :country
      t.string :university
      t.attachment :picture
    end
  end
end
