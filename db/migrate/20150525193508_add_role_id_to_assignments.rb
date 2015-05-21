class AddRoleIdToAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :role_id, :integer
    add_index :assignments, :role_id

    remove_column :assignments, :owner_id
    remove_column :assignments, :owner_type
  end

  def down
    remove_column :assignments, :role_id
    add_column :assignments, :owner_id, :integer
    add_column :assignments, :owner_type, :string

  end
end
