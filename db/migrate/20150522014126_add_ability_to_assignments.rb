class AddAbilityToAssignments < ActiveRecord::Migration
  def up
    add_column :assignments, :ability, :string
  end

  def down
    remove_column :assignments, :ability, :string
  end
end
