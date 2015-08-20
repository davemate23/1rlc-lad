class AddRelationToDependants < ActiveRecord::Migration
  def up
    add_column :dependants, :relation, :string
  end

  def down
    remove_column :dependants, :relation
  end
end
