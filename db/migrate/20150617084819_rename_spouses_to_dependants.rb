class RenameSpousesToDependants < ActiveRecord::Migration
  def up
    rename_table :spouses, :dependants
  end

  def down
    rename_table :dependants, :spouses
  end
end
