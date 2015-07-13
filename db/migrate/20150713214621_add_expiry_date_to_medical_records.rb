class AddExpiryDateToMedicalRecords < ActiveRecord::Migration
  def up
    add_column :medical_records, :expiry_date, :datetime
  end

  def down
    remove_column :medical_records, :expiry_date
  end
end
