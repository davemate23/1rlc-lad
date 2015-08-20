class AddDeletedAtToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :deleted_at, :datetime
    add_index :phones, :deleted_at
  end
end
