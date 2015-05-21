class AddEmployeeIdToAssignments < ActiveRecord::Migration
  def up
    remove_column :assignments, :assignment_id
    remove_column :assignments, :assignment_no
    remove_column :assignments, :resource_id
    remove_column :assignments, :resource_type
    remove_column :assignments, :ability
    remove_column :employees, :start_date
    remove_column :employees, :end_date
    remove_column :employees, :role_id

    add_column :assignments, :employee_id, :integer
    add_column :assignments, :start_date, :date
    add_column :assignments, :end_date, :date

    add_index :assignments, :employee_id
  end

  def down
    add_column :assignments, :assignment_id, :integer
    add_column :assignments, :assignment_no, :integer
    add_column :assignments, :resource_id, :integer
    add_column :assignments, :resource_type, :string
    add_column :assignments, :ability, :string
    add_column :employees, :start_date, :date
    add_column :employees, :end_date, :date
    add_column :employees, :role_id, :integer

    remove_column :assignments, :employee_id
    remove_column :assignments, :start_date
    remove_column :assignments, :end_date
  end
end
