class ChangeBioToQuoteInUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.rename :bio, :quote
  end
end
