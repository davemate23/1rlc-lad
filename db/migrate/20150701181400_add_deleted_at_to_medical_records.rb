class AddDeletedAtToMedicalRecords < ActiveRecord::Migration
  def change
    add_column :medical_records, :deleted_at, :datetime
    add_index :medical_records, :deleted_at
  end
end
