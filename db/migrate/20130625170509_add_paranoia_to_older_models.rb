class AddParanoiaToOlderModels < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    add_column :authorizations, :deleted_at, :datetime
  end
end
