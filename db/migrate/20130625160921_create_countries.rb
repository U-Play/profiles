class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string    :name, null: false, default: ''
      t.string    :abbrv_iso
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
