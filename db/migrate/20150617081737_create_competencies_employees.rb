class CreateCompetenciesEmployees < ActiveRecord::Migration
  def change
    create_table :competencies_employees do |t|
      t.integer :employee_id
      t.integer :competency_id
      t.integer :grade
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
