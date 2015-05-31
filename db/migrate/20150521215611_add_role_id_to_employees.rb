class AddRoleIdToEmployees < ActiveRecord::Migration
  def up
    add_column :employees, :role_id, :integer
    add_index :employees, :role_id
  end

  def down
    remove_column :employees, :role_id
  end
end
