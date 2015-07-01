class AddDeletedAtToPromotionDates < ActiveRecord::Migration
  def change
    add_column :promotion_dates, :deleted_at, :datetime
    add_index :promotion_dates, :deleted_at
  end
end
