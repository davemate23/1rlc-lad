class AddPointToPromitionDates < ActiveRecord::Migration
  def up
    add_column :promotion_dates, :rank_point, :integer
  end

  def down
    remove_column :promotion_dates, :rank_point, :integer
  end
end
