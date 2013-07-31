class AddReferralsToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    change_column :users, :token, :string, null: false, unique: true
    add_column :users, :referral_views, :integer, null: false, default: 0
    add_column :users, :referral_subscriptions, :integer, null: false, default: 0
  end
end
