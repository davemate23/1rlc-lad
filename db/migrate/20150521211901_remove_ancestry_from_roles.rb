class RemoveAncestryFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :ancestry
  end

  def down
    add_column :roles, :ancestry, :string
    add_index :roles, :ancestry
  end
end
