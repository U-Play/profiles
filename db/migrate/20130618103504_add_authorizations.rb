class AddAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :user
      t.string :provider, null: false
      t.string :uid,      null: false
      t.string :token
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :link
      t.string :image_url


      t.timestamps
    end
  end
end
