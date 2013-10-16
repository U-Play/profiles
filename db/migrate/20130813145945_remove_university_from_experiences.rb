class RemoveUniversityFromExperiences < ActiveRecord::Migration
  def up
    remove_column :experiences, :university
  end

  def down
    add_column :experiences, :university, :string
  end
end
