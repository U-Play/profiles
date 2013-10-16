class RemoveActiveStateFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :active
  end

  def down
    add_column :users, :active, :boolean, default: false
  end
end
