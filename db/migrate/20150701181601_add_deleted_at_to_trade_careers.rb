class AddDeletedAtToTradeCareers < ActiveRecord::Migration
  def change
    add_column :trade_careers, :deleted_at, :datetime
    add_index :trade_careers, :deleted_at
  end
end
