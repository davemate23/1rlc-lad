class AddDeletedAtToCompetenciesEmployees < ActiveRecord::Migration
  def change
    add_column :competencies_employees, :deleted_at, :datetime
    add_index :competencies_employees, :deleted_at
  end
end
