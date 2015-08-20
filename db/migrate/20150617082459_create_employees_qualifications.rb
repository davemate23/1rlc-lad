class CreateEmployeesQualifications < ActiveRecord::Migration
  def change
    create_table :employees_qualifications do |t|
      t.integer :employee_id
      t.integer :qualification_id
      t.integer :grade
      t.string :status
      t.string :school
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
