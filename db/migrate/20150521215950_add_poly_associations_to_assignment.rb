class AddPolyAssociationsToAssignment < ActiveRecord::Migration
  def up
    add_column :assignments, :owner_id, :integer
    add_column :assignments, :owner_type, :string

    add_index :assignments, :owner_id
    add_index :assignments, :owner_type

    add_column :assignments, :resource_id, :integer
    add_column :assignments, :resource_type, :string

    add_index :assignments, :resource_id
    add_index :assignments, :resource_type

    remove_column :assignments, :employee_id
    remove_column :assignments, :role_id
  end

  def down
    remove_column :assignments, :owner_id
    remove_column :assignments, :owner_type
    remove_column :assignments, :resource_id
    remove_column :assignments, :resource_type

    add_column :assignments, :employee_id, :integer
    add_column :assignments, :role_id, :integer

    add_index :assignments, :employee_id
    add_index :assignments, :role_id
  end
end



