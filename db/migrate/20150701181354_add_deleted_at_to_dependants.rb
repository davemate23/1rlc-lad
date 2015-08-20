class AddDeletedAtToDependants < ActiveRecord::Migration
  def change
    add_column :dependants, :deleted_at, :datetime
    add_index :dependants, :deleted_at
  end
end
