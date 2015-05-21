class AddCompetencyTypeToCompetencies < ActiveRecord::Migration
  def up
    rename_column :competencies, :type, :competency_type
  end

  def down
    rename_column :competencies, :competency_type, :type
  end
end
