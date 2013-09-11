class AddGenderToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :gender, :string
  end
end
