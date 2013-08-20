class AddIconRefToTournaments < ActiveRecord::Migration
  def up
    remove_column :tournaments, :icon
    add_column :tournaments, :icon_id, :integer
  end

  def down
    remove_column :tournaments, :icon_id
    add_column :tournaments, :icon, :string
  end
end
