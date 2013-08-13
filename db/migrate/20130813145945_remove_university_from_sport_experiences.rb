class RemoveUniversityFromSportExperiences < ActiveRecord::Migration
  def up
    remove_column :sport_experiences, :university
  end

  def down
    add_column :sport_experiences, :university, :string
  end
end
