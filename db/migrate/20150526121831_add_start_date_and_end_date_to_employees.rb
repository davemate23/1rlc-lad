class AddStartDateAndEndDateToEmployees < ActiveRecord::Migration
  def up
    add_column :employees, :start_date, :date
    add_column :employees, :end_date, :date

    remove_column :assignments, :start_date
    remove_column :assignments, :end_date
  end

  def down
    remove_column :employees, :start_date
    remove_column :employess, :end_date

    add_column :assignments, :start_date, :date
    add_column :assignments, :end_date, :date
  end
end
