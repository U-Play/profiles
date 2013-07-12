class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string    :name, null: false, default: ''
      t.text      :address
      t.string    :city
      t.string    :zip_code
      t.string    :phone
      t.text      :web_address
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
