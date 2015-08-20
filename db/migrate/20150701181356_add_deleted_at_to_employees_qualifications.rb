class AddDeletedAtToEmployeesQualifications < ActiveRecord::Migration
  def change
    add_column :employees_qualifications, :deleted_at, :datetime
    add_index :employees_qualifications, :deleted_at
  end
end
