class AddProfileStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_finished, :boolean, default: false
  end
end
