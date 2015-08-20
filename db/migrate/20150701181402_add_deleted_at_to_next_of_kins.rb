class AddDeletedAtToNextOfKins < ActiveRecord::Migration
  def change
    add_column :next_of_kins, :deleted_at, :datetime
    add_index :next_of_kins, :deleted_at
  end
end
