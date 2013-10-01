class RemoveQuoteFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :quote
  end

  def down
    add_column :users, :quote, :string
  end
end
