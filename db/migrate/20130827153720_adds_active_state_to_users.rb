class AddsActiveStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean, null: false, default: false
  end
end
