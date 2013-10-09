class RenameTeamTeamToTeamName < ActiveRecord::Migration
  def change
    rename_column :teams, :team, :name
  end
end
