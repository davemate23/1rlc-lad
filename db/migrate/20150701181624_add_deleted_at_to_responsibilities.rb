class AddDeletedAtToResponsibilities < ActiveRecord::Migration
  def change
    add_column :responsibilities, :deleted_at, :datetime
    add_index :responsibilities, :deleted_at
  end
end
