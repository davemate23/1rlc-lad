class CreatePromotionDates < ActiveRecord::Migration
  def change
    create_table :promotion_dates do |t|
      t.integer :employee_id
      t.string  :substantive_rank
      t.datetime :date
      t.timestamps
    end
  end
end
