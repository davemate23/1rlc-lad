class AddAgeToEmployees < ActiveRecord::Migration
  def up
    add_column :employees, :age, :integer
  end

  def down
    remove_column :employees, :age, :integer
  end
end
