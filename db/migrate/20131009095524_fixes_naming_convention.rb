class FixesNamingConvention < ActiveRecord::Migration
  def change
    rename_table :experiences, :teams

    %w(index_experiences_on_sport_id
       index_experiences_on_sport_role_id
       index_experiences_on_user_id
    ).each do |index|
      rename_index :teams, index, index.gsub('experiences', 'teams')
    end

    rename_column :tournaments, :experience_id, :team_id

    rename_index :tournaments, 'index_tournaments_on_experience_id', 'index_tournaments_on_team_id'
  end
end
