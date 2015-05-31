class AddRoleIdToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :role_id, :integer
    add_index :roles, :role_id
  end

  def down
    remove_column :roles, :role_id
  end
end
