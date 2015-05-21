class AddConfirmationToEmployees < ActiveRecord::Migration
  def up
    add_column :employees, :confirmation_token, :string
    add_column :employees, :unconfirmed_email, :string
    add_column :employees, :confirmed_at, :datetime
    add_column :employees, :confirmation_sent_at, :datetime

    add_index :employees, :confirmation_token, unique: true
  end

  def down
    remove_column :employees, :confirmation_token
    remove_column :employees, :confirmed_at
    remove_column :employees, :confirmation_sent_at
    remove_column :employees, :unconfirmed_email
  end
end
