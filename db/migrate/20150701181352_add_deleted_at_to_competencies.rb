class AddDeletedAtToCompetencies < ActiveRecord::Migration
  def change
    add_column :competencies, :deleted_at, :datetime
    add_index :competencies, :deleted_at
  end
end
