class ChangeProfileFinishedToProfileCompleteInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :profile_finished, :profile_complete
    end
  end
end
